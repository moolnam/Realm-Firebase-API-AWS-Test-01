//
//  ExploreView.swift
//  Realm-Test02
//
//  Created by KimJongHee on 2022/06/22.
//

import SwiftUI

struct ExploreView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    @ObservedObject var viewModel = ExploreViewModel()
    
    var body: some View {
        VStack {
            ScrollView { 
                LazyVStack {
                    ForEach(viewModel.users) { item in
                        NavigationLink {
                            ProfileView(user: item)

                        } label: {
                            UserRowView(user: item)
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
