//
//  ImagePicker.swift
//  Realm-Test02
//
//  Created by KimJongHee on 2022/06/29.
//

import Foundation
import SwiftUI


struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var selectedImage: UIImage?
//    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}


extension ImagePicker {
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
            
            parent.selectedImage = image
            parent.dismiss()
//            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
