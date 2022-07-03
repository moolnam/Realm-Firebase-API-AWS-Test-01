//
//  ContentView.swift
//  Realm-Test02
//
//  Created by KimJongHee on 2022/06/23.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    
    @State private var isShowMenu = false
    @EnvironmentObject var viewMdoel: AuthViewModel
    
    var body: some View {
        Group {
            if viewMdoel.userSession ==  nil {
                LoginView()
            }
            else {
                mainInterfaceView
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    
    var mainInterfaceView: some View {
        ZStack(alignment: .topLeading) {
            MainTabView()
                .navigationBarHidden(isShowMenu)
            
            if isShowMenu {
                ZStack {
                    Color.black.opacity(0.5)
                    
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        isShowMenu = false
                    }
                }
                .ignoresSafeArea(.all)
            }
            
            SideMenuView()
                .background(isShowMenu ? Color.white : Color.clear)
                .offset(x: isShowMenu ? 0 : -300, y: 0)
        }
        .navigationTitle("HOME")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarLeading, content: {
                if let user = viewMdoel.currentUser {
                    Button(action: {
                        isShowMenu.toggle()
                    }, label: {
                        KFImage(URL(string: user.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .cornerRadius(10)
                    })
                }
                else {
                    Button(action: {
                        isShowMenu.toggle()
                    }, label: {
                        Image(systemName: "person.circle.fill")
                            .font(.system(size: 30))
                    })
                }
            })
            
        })
        .onAppear() {
            isShowMenu = false
        }
    }
    
}
