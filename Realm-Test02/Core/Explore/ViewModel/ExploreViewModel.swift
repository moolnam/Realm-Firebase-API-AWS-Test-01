//
//  ExploreViewModel.swift
//  Realm-Test02
//
//  Created by KimJongHee on 2022/07/03.
//

import Foundation

class ExploreViewModel: ObservableObject {
    
    @Published var users = [User]()
    // User 빈 배열
    @Published var searchText = ""
    // 관측되는 텍스트필드
    
    var searchableUsers: [User] {
        if searchText.isEmpty {
            return users
            // searchText 가 isEmpty 라면 리턴 user 빈 배열
        }
        else {
            let lowercasedQuery = searchText.lowercased()
            // 소문자를 담아서
            return users.filter({
                $0.username.contains(lowercasedQuery) || $0.fullname.contains(lowercasedQuery)
                // username 과 fullname 을 소문자로
            })
        }
    }
    
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
