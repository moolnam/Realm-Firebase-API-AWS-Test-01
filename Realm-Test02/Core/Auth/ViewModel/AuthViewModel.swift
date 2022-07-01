//
//  AuthViewModel.swift
//  Realm-Test02
//
//  Created by KimJongHee on 2022/06/25.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    // 유저 현재 세션
    @Published var didAuth = false
    // 사진 업로드
    private var tempUserSession: FirebaseAuth.User?
    
    init() {
        self.userSession = Auth.auth().currentUser
        // 초기화. 세션 안에 현재 유저 로그인 되어있는지 안되어 있는지
        
        print("DEBUG: User session is \(String(describing: self.userSession))")
        // 초기화후 현재 로그인된 세션 있는지 없는지 로그.
    }
    
    func login(withEmail email: String, password: String) {
        print("DEBUG: Login with email \(email)")
        // 로그인 했을 때 찍히는 로그.
        Auth.auth().signIn(withEmail: email, password: password) { authDataResult, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let user = authDataResult?.user else {
                return
            }
            
            self.userSession = user
            // 로그인 되었을때 유저를 userSession 안에 넣는다.
        }
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let user = result?.user else {
                return
            }
            
            self.tempUserSession = user
            
            print("print \(user)_")
//            self.userSession = user
            // userSession 에 지금 user 데이터가 들어간다면 nil 이 아님으로 ProfilePhotoSelectorView로 넘어가지 않는다.
            // 내가 원하는 것은 프로필 사진 업로드 화면까지 넘어가는 것이다.
            
            let data = [
                // Firestore Database 안에 무엇을 넣을지
                
                "email" : email,
                "fullname" : fullname,
                "username" : username.lowercased(),
                "uid" : user.uid
            ]
            Firestore.firestore().collection("users")
            // Firestore 안에 어떠한 이름 안에 넣을지 "users"
                .document(user.uid)
            // document 는 user.uid
                .setData(data) { error in
                    if let error = error {
                        print(error.localizedDescription)
                        return
                    }
                    self.didAuth = true
                    // didAuth = true 는 사진 업로드 화면을 넘어가기 위한 작업
                }
        }
    }
    
    func logout() {
        userSession = nil
        // userSession 을 nil 로 만든다.
        try? Auth.auth().signOut()
        // 로그아웃 진행
    }
    
    func uploadProfileImage(_ image: UIImage) {
        guard let uid = tempUserSession?.uid else {
            return
        }

        ImageUploader.uploadImage(image: image) { urlImage in
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profileImageUrl": urlImage]) { _ in
                    self.userSession = self.tempUserSession
                }
        }
    }
}
