//
//  ExploreViewModel.swift
//  Realm-Test02
//
//  Created by KimJongHee on 2022/07/03.
//

import Foundation

class ExploreViewModel: ObservableObject {
    
    @Published var users = [User]()
    let service = UserService()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        service.fetchUsers { users in
            self.users = users
            
            print("DEBUG: =====================\(users)")
        }
    }
}
