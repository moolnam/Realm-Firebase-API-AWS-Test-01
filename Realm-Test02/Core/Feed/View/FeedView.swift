//
//  FeedView.swift
//  Realm-Test02
//
//  Created by KimJongHee on 2022/06/22.
//

import SwiftUI

struct FeedView: View {
    
    @State private var showNewTweetView = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                LazyVStack {
                    ForEach(0...20, id: \.self) { _ in
                        TweetRowView()
                    }
                }
            }
            Button(action: {
                showNewTweetView.toggle()
                print("새글쓰기 클릭")
            }, label: {
                Image(systemName: "square.and.pencil")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 50, height: 50, alignment: .center)
                    .padding()
            })
            .background(.white)
            .cornerRadius(20)
            .padding()
            .fullScreenCover(isPresented: $showNewTweetView) {
                UploadTweetView()
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
            .previewLayout(.sizeThatFits)
    }
}
