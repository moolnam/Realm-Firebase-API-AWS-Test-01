//
//  Realm_Test02App.swift
//  Realm-Test02
//
//  Created by KimJongHee on 2022/06/21.
//

import SwiftUI

@main
struct Realm_Test02App: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
//                .onAppear() {
//                    print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
//                    UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLatoutLogUnsatisfiable")
//                }
        }
    }
}
