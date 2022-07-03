//
//  SideView.swift
//  Realm-Test02
//
//  Created by KimJongHee on 2022/06/23.
//

import SwiftUI
import Kingfisher

struct SideMenuView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            if let user = authViewModel.currentUser {
                VStack(alignment: .leading) {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                    Text("\(user.username)")
                        .fontWeight(.bold)
                    Text("\(user.fullname)")
                        .font(.subheadline)
                        .padding(.bottom, 20)
                    UserStateView()
                }
                .padding()
                VStack(alignment: .leading) {
                    ForEach(SideMenuViewModel.allCases, id: \.rawValue) { item in
                        if item == .profile {
                            NavigationLink {
                                ProfileView(user: user)
                            } label: {
                                SideMenuRowView(viewModel: item)
                            }
                        }
                        else if item == .lists {
                            NavigationLink {
                                
                            } label: {
                                SideMenuRowView(viewModel: item)
                            }
                        }
                        else if item == .bookmarks {
                            NavigationLink {
                                
                            } label: {
                                SideMenuRowView(viewModel: item)
                            }
                        }
                        else if item == .logout {
                            Button(action: {
                                print("로그아웃 버튼 누름")
                                authViewModel.logout()
                            }, label: {
                                SideMenuRowView(viewModel: item)
                            })
                        }
                        else {
                            SideMenuRowView(viewModel: item)
                        }
                    }
                }
            }
            
            
            Spacer()
        }
        .padding(.trailing, 100)
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
            .previewLayout(.sizeThatFits)
            
    }
}




