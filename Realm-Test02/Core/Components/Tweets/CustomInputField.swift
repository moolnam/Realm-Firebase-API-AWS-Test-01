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
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: imageName)
                TextField(placeholderText, text: $text)
            }
            Divider()
                .background(.black)
        }
        .padding()
    }
}

struct CustomInputField_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputField(text: .constant(""), imageName: "envelope", placeholderText: "Email")
    }
}
