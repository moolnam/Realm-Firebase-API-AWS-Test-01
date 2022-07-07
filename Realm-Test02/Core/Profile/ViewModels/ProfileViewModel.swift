//
//  ProfileViewModel.swift
//  Realm-Test02
//
//  Created by KimJongHee on 2022/07/06.
//

import Foundation


class ProgileViewModel: ObservableObject {
    
    @Published var tweets = [Tweet]()
    // tweets 빈 배열 생성
    let service = TweetService()
    let user: User
    // Model User 가져오기
    
    
    init(user: User) {
        self.user = user
        self.fetchUserTweets()
    }
    
    func fetchUserTweets() {
        guard let uid = user.id else {
            // user.id 를 벗겨서 uid 에 담는다.
            return
        }
        service.fetchTweets(forUid: uid) { tweets in
            self.tweets = tweets
            
            for i in 0 ..< tweets.count {
                self.tweets[i].user = self.user
            }
        }
    }
}
