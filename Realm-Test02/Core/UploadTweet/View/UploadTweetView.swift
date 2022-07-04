//
//  UploadTweetView.swift
//  Realm-Test02
//
//  Created by KimJongHee on 2022/06/24.
//

import SwiftUI
import Kingfisher

struct UploadTweetView: View {
    
    @State private var caption = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var authViewModel: AuthViewModel
    @ObservedObject var viewModel = TweetViewModel()
    
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    print("취소 클릭")
                    dismiss()
                }, label: {
                    Text("취소")
                })
                Spacer()
                Button(action: {
                    self.viewModel.uploadTweet(withCaption: caption)
                }, label: {
                    Text("업로드")
                        .font(.headline)
                        .padding(.all, 10)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                })
            }
            .padding(.horizontal, 30)
            .padding(.vertical, 10)
            HStack(alignment: .top) {
                if let user = authViewModel.currentUser {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                }
                else {
                    Image(systemName: "person.circle.fill")
                        .font(.system(size: 50))
                }
                TextArea("포스트 입력", text: $caption)
//                TextField("포스트 입력", text: $textFeild)
            }
            .padding(.horizontal, 30)
            Spacer()
        }
        .onReceive(viewModel.$didUploadTweet) { success in
            if success {
                dismiss()
            }
        }
    }
}

struct UploadTweetView_Previews: PreviewProvider {
    static var previews: some View {
        UploadTweetView()
    }
}
