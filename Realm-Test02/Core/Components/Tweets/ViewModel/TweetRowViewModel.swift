//
//  TweetViewModel.swift
//  Realm-Test02
//
//  Created by KimJongHee on 2022/07/06.
//

import Foundation

class TweetRowViewModel: ObservableObject {
    private var service = TweetService()
    
    @Published var tweet: Tweet
    
    init(tweet: Tweet) {
        self.tweet = tweet
    }
    
    func likeTweet() {
        service.likeTweet(tweet) {
            self.tweet.didlike = true
        }
    }
}
