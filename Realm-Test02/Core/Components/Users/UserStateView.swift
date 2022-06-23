//
//  UserStateView.swift
//  Realm-Test02
//
//  Created by KimJongHee on 2022/06/23.
//

import SwiftUI

struct UserStateView: View {
    var body: some View {
        HStack {
            HStack {
                Text("234")
                    .fontWeight(.bold)
                Text("팔로워")
            }
            HStack {
                Text("392")
                    .fontWeight(.bold)
                Text("팔로잉")
            }
        }
    }
}

struct UserStateView_Previews: PreviewProvider {
    static var previews: some View {
        UserStateView()
    }
}
