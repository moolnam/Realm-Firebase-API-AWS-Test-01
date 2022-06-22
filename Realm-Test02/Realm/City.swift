//
//  City.swift
//  Realm-Test02
//
//  Created by KimJongHee on 2022/06/21.
//

import Foundation
import RealmSwift

class City: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
}
