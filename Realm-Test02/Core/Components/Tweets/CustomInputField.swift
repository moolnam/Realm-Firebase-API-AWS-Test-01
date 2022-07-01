//
//  CustomInputField.swift
//  Realm-Test02
//
//  Created by KimJongHee on 2022/06/24.
//

import SwiftUI

struct CustomInputField: View {
    
    @Binding var text: String
    let imageName: String
    let placeholderText: String
    var isSecureField: Bool? = false
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: imageName)
                if isSecureField ?? false {
                    SecureField(placeholderText, text: $text)
                }
                else {
                    TextField(placeholderText, text: $text)
                }
                
            }
            Divider()
                .background(.black)
        }
        .padding()
    }
}

struct CustomInputField_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputField(text: .constant(""), imageName: "envelope", placeholderText: "Email", isSecureField: false)
    }
}
