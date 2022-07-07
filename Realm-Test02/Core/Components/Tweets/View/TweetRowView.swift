//
//  TweetRowView.swift
//  Realm-Test02
//
//  Created by KimJongHee on 2022/06/22.
//

import SwiftUI
import Kingfisher

struct TweetRowView: View {
    
    @ObservedObject var viewModel: TweetRowViewModel
    
    init(tweet: Tweet) {
        self.viewModel = TweetRowViewModel(tweet: tweet)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if let user = viewModel.tweet.user {
                HStack(alignment: .top, spacing: 20) {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .cornerRadius(10)
                    VStack(alignment: .leading) {
                        HStack {
                            VStack(alignment: .leading){
                                Text("\(user.fullname)")
                                    .fontWeight(.bold)
                                Text("\(user.username)")
                                    .font(.caption2)
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                            Text("date")
                                .foregroundColor(.secondary)
                        }
                        .padding(.bottom, 5)
                        Text("\(viewModel.tweet.caption)")
                    }
                    Spacer()
                }
                .padding(.bottom, 30)
            }
            HStack {
                
                Button(action: {}, label: {
                    Image(systemName: "bubble.left")
                })
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "square.and.arrow.up.on.square")
                })
                Spacer()
                Button(action: {
                    self.viewModel.likeTweet()
                }, label: {
                    Image(systemName: viewModel.tweet.didlike ?? false ? "heart.fill" : "heart")
                        .foregroundColor(viewModel.tweet.didlike ?? false ? Color.red : Color.blue)
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

//struct TweetRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        TweetRowView()
//            .previewLayout(.sizeThatFits)
//    }
//}
