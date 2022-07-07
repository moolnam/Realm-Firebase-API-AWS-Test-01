//
//  TweetViewModel.swift
//  Realm-Test02
//
//  Created by KimJongHee on 2022/07/04.
//

import Foundation


class TweetViewModel: ObservableObject {
    
    @Published var didUploadTweet = false
    
    let service = TweetService()
    
    func uploadTweet(withCaption caption: String) {
        service.uploadTweet(caption: caption) { success in
            if success {
                self.didUploadTweet = true
            }
            else {
                
            }
        }
    }
    
}
