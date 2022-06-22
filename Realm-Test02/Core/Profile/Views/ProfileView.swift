//
//  ProfileView.swift
//  Realm-Test02
//
//  Created by KimJongHee on 2022/06/22.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        headerView
        
        Spacer()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

extension ProfileView {
    var headerView: some View {
        VStack {
            ZStack(alignment: .bottomLeading) {
                Color.blue
                Image(systemName: "person.circle.fill")
                    .background(.green)
                    .cornerRadius(20)
                    .foregroundColor(.white)
                    .font(.system(size: 100))
                    .offset(x: 30, y: 50)
            }
            .ignoresSafeArea(.all)
            .frame(height: 150)
            
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    Button(action: {}, label: {
                        Image(systemName: "bell.badge.fill")
                    })
                    Button(action: {}, label: {
                        Text("프로필 편집")
                            .foregroundColor(.white)
                            .padding(5)
                            .background(.blue)
                            .cornerRadius(10)
                    })
                }
                .padding()
                .foregroundColor(.green)
                .font(.system(size: 30))
                VStack(alignment: .leading) {
                    Text("MOOL MAN")
                        .font(.title)
                        .bold()
                    Text("@moolman")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text("자기소개")
                        .font(.subheadline)
                        .padding(.vertical, 10)
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
                    .padding()
                    HStack {
                        HStack {
                            Text("232")
                            Text("팔로잉")
                                .foregroundColor(.secondary)
                        }
                        HStack {
                            Text("214")
                            Text("팔로워")
                                .foregroundColor(.secondary)
                        }
                    }
                    .font(.title2)
                }
                .font(.system(size: 25))
                .padding()
            }
            
            Spacer()
        }
    }
}
