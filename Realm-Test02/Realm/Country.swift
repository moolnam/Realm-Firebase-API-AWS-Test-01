//
//  Country.swift
//  Realm-Test02
//
//  Created by KimJongHee on 2022/06/21.
//

import Foundation
import RealmSwift


class Country: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String
    @Persisted var cities: List<City>
    
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
}
