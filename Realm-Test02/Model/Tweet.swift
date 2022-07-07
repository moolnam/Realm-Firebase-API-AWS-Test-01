//
//  Tweet.swift
//  Realm-Test02
//
//  Created by KimJongHee on 2022/07/05.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase

struct Tweet: Identifiable, Decodable {
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    let uid: String
    var likes: Int
    
    var user: User?
    var didlike: Bool? = false
}
