//
//  UploadTweetView.swift
//  Realm-Test02
//
//  Created by KimJongHee on 2022/06/24.
//

import SwiftUI

struct UploadTweetView: View {
    
    @State var textFeild = ""
    @Environment(\.dismiss) var dismiss
    
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
                    print("업로드 클릭")
                }, label: {
                    Text("업로드")
                })
            }
            .padding(.horizontal, 30)
            HStack(alignment: .top) {
                Image(systemName: "person.circle")
                    .font(.system(size: 50))
                TextArea("포스트 입력", text: $textFeild)
//                TextField("포스트 입력", text: $textFeild)
            }
            .padding(.horizontal, 30)
            Spacer()
        }
    }
}

struct UploadTweetView_Previews: PreviewProvider {
    static var previews: some View {
        UploadTweetView()
    }
}
