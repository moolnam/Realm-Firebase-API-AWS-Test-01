//
//  Realm_Test02App.swift
//  Realm-Test02
//
//  Created by KimJongHee on 2022/06/21.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct Realm_Test02App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject var viewModel = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environmentObject(viewModel)
//                .onAppear() {
//                    print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
//                    UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLatoutLogUnsatisfiable")
//                }
        }
    }
}
