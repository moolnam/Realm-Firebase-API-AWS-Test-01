//
//  AuthHeaderView.swift
//  Realm-Test02
//
//  Created by KimJongHee on 2022/06/24.
//

import SwiftUI

struct AuthHeaderView: View {
    
    let title1: String
    let title2: String
    
    var body: some View {
        VStack {
            Text(title1)
            Text(title2)
        }
        .foregroundColor(.white)
        .font(.system(size: 50))
        .frame(width: UIScreen.main.bounds.height, height: UIScreen.main.bounds.height / 3)
        .background(.blue)
    }
}

struct AuthHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        AuthHeaderView(title1: "안녕하세요.", title2: "반갑습니다.")
    }
}
