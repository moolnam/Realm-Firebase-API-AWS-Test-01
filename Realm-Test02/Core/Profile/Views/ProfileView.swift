//
//  ProfileView.swift
//  Realm-Test02
//
//  Created by KimJongHee on 2022/06/22.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    
    @State var selectedFilter: TweetFilterViewModel = .tweets
    @Namespace var animation
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: ProgileViewModel
    
    init(user: User) {
        self.viewModel = ProgileViewModel(user: user)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            headerView
            
            tweetFilterBar
            
            tweetView
            
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User(id: NSUUID().uuidString, username: "username", fullname: "fullname", profileImageUrl: "profileimage", email: "email"))
            .previewLayout(.sizeThatFits)
    }
}

extension ProfileView {
    var headerView: some View {
        VStack {
            ZStack(alignment: .bottomLeading) {
                Color.blue.opacity(0.5)
                KFImage(URL(string: viewModel.user.profileImageUrl))
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: 150, height: 150)
                    .offset(x: 30, y: 30)
            }
            .ignoresSafeArea(.all)
            .frame(height: 120)
            
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    Button(action: {}, label: {
                        Image(systemName: "bell.badge.fill")
                    })
                    Button(action: {}, label: {
                        Text("프로필 편집")
                            .foregroundColor(.green)
                            .padding(5)
                            .cornerRadius(5)
                    })
                }
                .foregroundColor(.green)
                .font(.system(size: 20))
                VStack(alignment: .leading) {
                    Text("\(viewModel.user.fullname)")
                        .font(.title)
                        .bold()
                    Text("@\(viewModel.user.username)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text("자기소개")
                        .font(.subheadline)
                        .padding(.top, 10)
                    HStack {
                        Spacer()
                        HStack {
                            Image(systemName: "mappin.and.ellipse")
                            Text("대한민국 서울")
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .padding(.horizontal, 20)
                        Button(action: {}, label: {
                            HStack {
                                Image(systemName: "link.circle.fill")
                                Text("웹사이트")
                            }
                        })
                    }
                    .padding(.bottom, 10)
                    UserStateView()
                    .font(.title2)
                }
                .font(.system(size: 25))
                .padding()
            }
        }
    }
    
    var tweetFilterBar: some View {
        HStack {
            ForEach(TweetFilterViewModel.allCases, id: \.rawValue) { item in
                VStack {
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == item ? .bold : .regular)
                        .foregroundColor(selectedFilter == item ? .black : .secondary)
                    
                    if selectedFilter == item {
                        Capsule()
                            .frame(height: 5)
                            .foregroundColor(.blue)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    }
                    else {
                        Capsule()
                            .frame(height: 5)
                            .foregroundColor(.clear)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedFilter = item
                    }
                }
            }
        }
        .overlay(Divider().offset(x: 0, y: 18))
    }
    
    var tweetView: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.tweets) { item in
                    TweetRowView(tweet: item)
                }
            }
        }
    }
}
