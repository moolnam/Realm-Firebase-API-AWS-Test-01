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
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        print("DEBUG: User session is \(String(describing: self.userSession))")
    }
    
    func login(withEmail email: String, password: String) {
        print("DEBUG: Login with email \(email)")
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
            
            print("print \(user)_")
            self.userSession = user
            
            let data = [
                "email" : email,
                "fullname" : fullname,
                "username" : username.lowercased(),
                "uid" : user.uid
            ]
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { error in
                    if let error = error {
                        print(error.localizedDescription)
                        return
                    }
                }
        }
    }
    
    func logout() {
        userSession = nil
        
        try? Auth.auth().signOut()
    }
}
