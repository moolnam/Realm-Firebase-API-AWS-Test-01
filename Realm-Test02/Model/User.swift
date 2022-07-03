//
//  User.swift
//  Realm-Test02
//
//  Created by KimJongHee on 2022/07/03.
//

import FirebaseFirestoreSwift
import Foundation

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
}
