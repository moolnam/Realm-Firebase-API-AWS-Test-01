//
//  LoginView.swift
//  Realm-Test02
//
//  Created by KimJongHee on 2022/06/24.
//

import SwiftUI

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            VStack {
                Text("안녕하세요.\n반갑습니다.")
                    .font(.system(size: 50))
                    .foregroundColor(.white)
            }
            .frame(width: UIScreen.main.bounds.height, height: UIScreen.main.bounds.height / 4)
            .background(.blue)
            
            VStack {
                VStack {
                    TextField("이메일", text: $email)
                    TextField("비밀번호", text: $password)
                }
                .padding()
                HStack {
                    Spacer()
                    NavigationLink {
                        Text("비밀번호 아이디 화면")
                    } label: {
                        Text("비밀번호 아이디 찾기")
                            .foregroundColor(.blue)
                    }
                }
                .padding(.bottom, 40)
                Button(action: {}, label: {
                    Text("로그인")
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.height / 3)
                })
                .padding()
                .background(.blue)
                .cornerRadius(20)
                Spacer()
                Button(action: {}, label: {
                    Text("계정 만들기")
                })
            }
            .padding()
            .font(.system(size: 30))
            
            Spacer()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
