//
//  TweetRowView.swift
//  Realm-Test02
//
//  Created by KimJongHee on 2022/06/22.
//

import SwiftUI

struct TweetRowView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 20) {
                Image(systemName: "person.circle.fill")
                    .font(.system(size: 50))
                    .foregroundColor(.blue)
                VStack(alignment: .leading) {
                    HStack {
                        Text("MOOL MAN")
                            .fontWeight(.bold)
                        Text("06/22/14:43")
                            .foregroundColor(.secondary)
                    }
                    Text("안녕하세요 물질하는 남자")
                }
                Spacer()
            }
            .padding(.bottom, 30)
            HStack {
                
                Button(action: {}, label: {
                    Image(systemName: "bubble.left")
                })
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "square.and.arrow.up.on.square")
                })
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "heart.square")
                })
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "bookmark.square")
                })
                
                
            }
            .font(.system(size: 25))
            .foregroundColor(.blue)
            Divider()
        }
        .padding()
        .background(.cyan.opacity(0.5))
        .cornerRadius(10)
        .padding()
    }
}

struct TweetRowView_Previews: PreviewProvider {
    static var previews: some View {
        TweetRowView()
            .previewLayout(.sizeThatFits)
    }
}
