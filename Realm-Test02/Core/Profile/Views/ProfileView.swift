//
//  ProfileView.swift
//  Realm-Test02
//
//  Created by KimJongHee on 2022/06/22.
//

import SwiftUI

struct ProfileView: View {
    
    @State var selectedFilter: TweetFilterViewModel = .tweets
    @Namespace var animation
    @Environment(\.dismiss) var dismiss
    
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
        ProfileView()
            .previewLayout(.sizeThatFits)
    }
}

extension ProfileView {
    var headerView: some View {
        VStack {
            ZStack(alignment: .bottomLeading) {
                Color.blue.opacity(0.5)
                Image(systemName: "person.circle.fill")
                    .background(.green)
                    .cornerRadius(20)
                    .foregroundColor(.white)
                    .font(.system(size: 100))
                    .offset(x: 30, y: 50)
                VStack(alignment: .trailing) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "arrow.backward.square.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 40))
                    })
                }
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
                    Text("MOOL MAN")
                        .font(.title)
                        .bold()
                    Text("@moolman")
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
                ForEach(0...9, id: \.self) { item in
                    TweetRowView()
                }
            }
        }
    }
}
