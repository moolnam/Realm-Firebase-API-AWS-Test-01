//
//  ContentView.swift
//  Realm-Test02
//
//  Created by KimJongHee on 2022/06/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isShowMenu = false
    
    var body: some View {
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
            }
            
            SideMenuView()
                .background(isShowMenu ? Color.white : Color.clear)
                .offset(x: isShowMenu ? 0 : -300, y: 0)
        }
        .navigationTitle("HOME")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarLeading, content: {
                Button(action: {
                    isShowMenu.toggle()
                }, label: {
                    Image(systemName: "person.circle.fill")
                        .font(.system(size: 30))
                })
            })
            
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
