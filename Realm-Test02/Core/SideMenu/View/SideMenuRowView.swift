//
//  SideMenuRowView.swift
//  Realm-Test02
//
//  Created by KimJongHee on 2022/06/23.
//

import SwiftUI

struct SideMenuRowView: View {
    
    let viewModel: SideMenuViewModel
    
    var body: some View {
        HStack {
            Image(systemName: viewModel.imageName)
            Text(viewModel.description)
        }
        .font(.system(size: 20))
        .padding()
    }
}

struct SideMenuRowView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuRowView(viewModel: .profile)
    }
}
