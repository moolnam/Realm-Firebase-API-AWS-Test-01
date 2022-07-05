//
//  TweetService.swift
//  Realm-Test02
//
//  Created by KimJongHee on 2022/07/04.
//

import Foundation
import Firebase


struct TweetService {
    func uploadTweet(caption: String, completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let data = [
            "uid": uid,
            "caption": caption,
            "likes": 0,
            "timestamp": Timestamp(date: Date())
        ] as [String : Any]
        
        Firestore.firestore().collection("tweets").document()
            .setData(data) { error in
                if let error = error {
                    print(error.localizedDescription)
                    completion(false)
                    return
                }
                completion(true)
            }
    }
    
    func fetchTweets(completion: @escaping([Tweet]) -> Void) {
        Firestore.firestore().collection("tweets")
            .order(by: "timestamp", descending: true)
            .getDocuments { snapshot, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                guard let documents = snapshot?.documents else {
                    return
                }
                
                let tweets = documents.compactMap({
                    try? $0.data(as: Tweet.self)
                })
                
                completion(tweets)
            }
    }
}
