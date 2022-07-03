//
//  ExploreView.swift
//  Realm-Test02
//
//  Created by KimJongHee on 2022/06/22.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        VStack {
            ScrollView { 
                LazyVStack {
                    ForEach(0...20, id: \.self) { item in
                        NavigationLink {
//                            ProfileView()
//                                .navigationBarHidden(true)

                        } label: {
                            UserRowView()
                        }
                    }
                }
            }
        }
//        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
            .previewLayout(.sizeThatFits)
    }
}
