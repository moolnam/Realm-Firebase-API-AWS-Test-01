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
        // 파이어베이스에 트윗 데이터 저장
        // @escaping Bool 타입으로 만들어준다. 반환은 Void
        guard let uid = Auth.auth().currentUser?.uid else {
            // 현재 유저를 담는다. uid
            return
        }
        
        let data = [
            // uid, caption, likes, timestamp 4가지 데이터를 data 안에 담는다.
            "uid": uid,
            "caption": caption,
            "likes": 0,
            "timestamp": Timestamp(date: Date())
        ] as [String : Any]
        // String: Any 타입으로 타입캐스팅 해준다.
        
        Firestore.firestore().collection("tweets")
        // 컬렉션 tweets 를 만든다.
            .document()
            .setData(data) { error in
                if let error = error {
                    print(error.localizedDescription)
                    completion(false)
                    // error 가 발생하면 completion(false)
                    return
                }
                completion(true)
                // 성공하면 completion(true)
            }
    }
    
    func fetchTweets(completion: @escaping([Tweet]) -> Void) {
        // 트윗 목록 가져오기
        // home 뷰에 시간 순으로 나타낼 트윗
        // @escaping [Tweet] 배열 타입으로 만들어 주고 Void 로 반환한다.
        Firestore.firestore().collection("tweets")
            .order(by: "timestamp", descending: true)
        // .order = 지정된 timestamp 기준으로 선택적으로 오름차순 대신 내림차순으로
            .getDocuments { snapshot, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                guard let documents = snapshot?.documents else {
                    // documents 안에 tweets 컬렉션 안에 있는 것들을 담는다.
                    return
                }
                
                let tweets = documents.compactMap({
                    // compactMap 은 닐이 아닐경우 옵셔널을 벗겨내서 출력하고
                    // 닐일 경우 내뱉지 않는다.
                    try? $0.data(as: Tweet.self)
                })
                
                completion(tweets)
            }
    }
    
    func fetchTweets(forUid uid: String, comlpetion: @escaping([Tweet]) -> Void) {
        // 현재 계정의 트윗 목록만 가져오기
        // proflieview 에 같은 uid 만 나타낼 트윗
        // 선택된 uid 가지고 그 uid 안에 있는 데이터만 따로 가져올려고 하는 목적
        Firestore.firestore().collection("tweets")
            .whereField("uid", isEqualTo: uid)
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
                
                comlpetion(tweets.sorted(by: {
                    $0.timestamp.dateValue() > $1.timestamp.dateValue()
                }))
            }
    }
    
    func likeTweet(_ tweet: Tweet, completion: @escaping() -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let tweetId = tweet.id else { return}
        let userLikeRef = Firestore.firestore().collection("users")
            .document(uid)
            .collection("user-likes")
        Firestore.firestore().collection("tweets")
            .document(tweetId)
            .updateData(["likes" : tweet.likes + 1]) { error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                userLikeRef.document(tweetId)
                    .setData([:]) { _ in
                        print("DEBUG: Did like tweet and now we should updata UI")
                        
                        completion()
                    }
            }
    }
    
    func checkIfUserLikedTweet(_ tweet: Tweet, completion: @escaping(Bool) -> Void) {
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let tweetId = tweet.id else { return }
        
        Firestore.firestore().collection("user")
            .document(uid)
            .collection("user-likes")
            .document(tweetId)
            .getDocument { snapshot, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                guard let snapshot = snapshot else {
                    return
                }
                completion(snapshot.exists)
                // 문서가 있으면 true
            }
    }
}
