//
//  FeedViewModel.swift
//  Realm-Test02
//
//  Created by KimJongHee on 2022/07/05.
//

import Foundation

class FeedViewModel: ObservableObject {
    
    @Published var tweets = [Tweet]()
    
    let service = TweetService()
    let userService = UserService()
    
    init() {
        fetchTweet()
    }
    
    func fetchTweet() {
        service.fetchTweets { tweets in
            self.tweets = tweets
            
            for i in 0 ..< tweets.count {
                let uid = tweets[i].uid
                
                self.userService.fetchUser(withUid: uid) { user in
                    self.tweets[i].user = user
                }
            }
            
//            tweets.forEach { tweet in
//                let uid = tweet.uid
//
//                self.userService.fetchUser(withUid: uid) { user in
//
//                }
//            }
        }
    }
}
