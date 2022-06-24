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
    func register(withEmail email: String, password: String, fullName: String, userName: String) {
        print("DEBUG: Register with email \(email)")
    }
}
