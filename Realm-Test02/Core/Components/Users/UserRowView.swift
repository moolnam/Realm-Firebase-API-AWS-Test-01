//
//  UserView.swift
//  Realm-Test02
//
//  Created by KimJongHee on 2022/06/23.
//

import SwiftUI

struct UserRowView: View {
    var body: some View {
        HStack {
            
            Image(systemName: "person.circle.fill")
                .font(.system(size: 50))
                .foregroundColor(.blue)
            
            VStack(alignment: .leading) {
                Text("Name")
                    .fontWeight(.bold)
                Text("MOOL MAN")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView()
            .previewLayout(.sizeThatFits)
    }
}
