//
//  UserService.swift
//  Realm-Test02
//
//  Created by KimJongHee on 2022/07/03.
//

import Firebase
import FirebaseFirestoreSwift

struct UserService {
    func fetchUser(withUid uid: String, completion: @escaping(User) -> Void) {
        // uid 계정 가져오기
        print("DEBUG: Fetch User Info...")
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                guard let snapshot = snapshot else {
                    return
                }
                
                guard let user = try? snapshot.data(as: User.self) else {
                    return
                }
                
                print("DEBUG: User name is \(user.username)")
                print("DEBUG: User fullname is \(user.fullname)")
                print("DEBUG: User email is \(user.email)")
                print("DEBUG: User photo is \(user.profileImageUrl)")
                completion(user)
            }
    }
    
    func fetchUsers(completion: @escaping([User]) -> Void) {
        // 유저 목록 가져오기
//        var users = [User]()
        Firestore.firestore().collection("users")
            .getDocuments { snapshot, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                guard let document = snapshot?.documents else {
                    return
                }
                let users = document.compactMap({ try? $0.data(as: User.self )})
                
//                document.forEach { document in
//                    guard let user = try? document.data(as: User.self) else {
//                        return
//                    }
//                    users.append(user)
//                }
                completion(users)
            }
    }
}


