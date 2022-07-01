//
//  ImageUpload.swift
//  Realm-Test02
//
//  Created by KimJongHee on 2022/07/01.
//

import Foundation
import SwiftUI
import UIKit
import FirebaseStorage


struct ImageUploader {
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {
            // image 를 jpegData 로 0.5 퀄리티로 image 값을 넣는다.
            return
        }
        
        let fileName = NSUUID().uuidString
        // fileName 고유한 무언가를 만든것 같다.
        let ref = Storage.storage().reference(withPath: "/profie_image\(fileName)")
        // ref 안에 만들 이미지 url
        
        ref.putData(imageData) { _, error in
            // ref 안에 데이터를 넣는다 imageData 를
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            ref.downloadURL { url, error in
                // ref 안에 있는 iamgeData url 를 다운한다.
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                guard let imageURL = url?.absoluteString else {
                    return
                    
                }
                completion(imageURL)
            }
        }
    }
}
