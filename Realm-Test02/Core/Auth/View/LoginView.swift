//
//  LoginView.swift
//  Realm-Test02
//
//  Created by KimJongHee on 2022/06/24.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            VStack {
                AuthHeaderView(title1: "로그인 화면", title2: "반갑습니다")
            }
            .frame(width: UIScreen.main.bounds.height, height: UIScreen.main.bounds.height / 4)
            .background(.blue)
            .padding()
            VStack {
                VStack {
                    CustomInputField(text: $email, imageName: "envelope", placeholderText: "이메일")
                        
                    CustomInputField(text: $password, imageName: "lock", placeholderText: "비밀번호")
//                    TextField("비밀번호", text: $password)
                }
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
                Button(action: {
                    viewModel.login(withEmail: email, password: password)
                }, label: {
                    Text("로그인")
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.height / 3)
                })
                .padding()
                .background(.blue)
                .cornerRadius(20)
                Spacer()
                NavigationLink {
                    RegistrationView()
                        .navigationBarHidden(true)
                } label: {
                    Text("회원가입")
                        .foregroundColor(.blue)
                }
            }
            .padding()
            .font(.system(size: 30))
            
            Spacer()
        }
        .navigationBarHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
