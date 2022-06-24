//
//  RegistrationView.swift
//  Realm-Test02
//
//  Created by KimJongHee on 2022/06/24.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var userName = ""
    @State private var fullName = ""
    
    var body: some View {
        VStack {
            AuthHeaderView(title1: "회원가입 화면", title2: "반갑습니다")
            
            VStack {
                CustomInputField(text: $email, imageName: "envelope", placeholderText: "이메일")
                CustomInputField(text: $userName, imageName: "person", placeholderText: "닉네임")
                CustomInputField(text: $fullName, imageName: "person", placeholderText: "이름")
                CustomInputField(text: $password, imageName: "lock", placeholderText: "비밀번호")
            }
            .font(.system(size: 30))
            
            Button(action: {}, label: {
                Text("회원가입")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width / 2)
            })
            .padding()
            .background(.blue)
            .cornerRadius(20)
            Spacer()
            Button(action: {}, label: {
                Text("계정 있음. 로그인 하기")
            })
            
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
