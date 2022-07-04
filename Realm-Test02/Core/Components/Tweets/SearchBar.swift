//
//  SearchBar.swift
//  Realm-Test02
//
//  Created by KimJongHee on 2022/07/03.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("입력", text: $text)
                .padding()
                .background(.gray.opacity(0.1))
                .cornerRadius(10)
        }
        .padding(.vertical, 10)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
    }
}
