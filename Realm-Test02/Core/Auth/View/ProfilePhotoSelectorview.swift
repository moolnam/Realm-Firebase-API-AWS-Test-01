//
//  ProfilePhotoSelectorview.swift
//  Realm-Test02
//
//  Created by KimJongHee on 2022/06/29.
//

import SwiftUI

struct ProfilePhotoSelectorview: View {
    
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        VStack {
            AuthHeaderView(title1: "사진업로드", title2: "해주세요")
            Button(action: {
                showImagePicker.toggle()
            }, label: {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .modifier(ProfileImageModifire())
                } else {
                    Image(systemName: "person")
                        .modifier(ProfileImageModifire())
                }
            })
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                ImagePicker(selectedImage: $selectedImage)
            }
            
            if let selectedImage = selectedImage {
                Button(action: {
                    print("사진 업로드 클릭")
                    authViewModel.uploadProfileImage(selectedImage)
                }, label: {
                    Text("사진 업로드")
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                        .frame(width: 300, height: 60)
                        .background(Color.blue)
                        .cornerRadius(20)
                        .padding()
                })
            }
            
            Spacer()
        }
        .ignoresSafeArea(.all)
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else {
            return
        }
        profileImage = Image(uiImage: selectedImage)

    }
}

private struct ProfileImageModifire: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFill()
            .frame(width: 300, height: 300, alignment: .center)
            .font(.system(size: 200))
            .clipShape(Circle())
    }
}

struct ProfilePhotoSelectorview_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorview()
    }
}
