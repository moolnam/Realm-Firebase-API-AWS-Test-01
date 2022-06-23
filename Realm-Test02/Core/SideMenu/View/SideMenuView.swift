//
//  SideView.swift
//  Realm-Test02
//
//  Created by KimJongHee on 2022/06/23.
//

import SwiftUI

struct SideMenuView: View {
    var body: some View {
        VStack(alignment: .leading) {
            sideTopMenu
            
            sideMenuButtom
            
            Spacer()
        }
        .padding(.trailing, 100)
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
            .previewLayout(.sizeThatFits)
            
    }
}


extension SideMenuView {
    var sideTopMenu: some View {
        VStack(alignment: .leading) {
            Image(systemName: "person.circle")
                .font(.system(size: 50))
            Text("User Name")
                .fontWeight(.bold)
            Text("moolman")
                .font(.subheadline)
                .padding(.bottom, 20)
            UserStateView()
        }
        .padding()
        
    }
    
    var sideMenuButtom: some View {
        VStack(alignment: .leading) {
            ForEach(SideMenuViewModel.allCases, id: \.rawValue) { item in
                HStack {
                    Image(systemName: item.imageName)
                    Text(item.description)
                }
                .font(.system(size: 20))
                .padding()
            }
        }
    }
}
