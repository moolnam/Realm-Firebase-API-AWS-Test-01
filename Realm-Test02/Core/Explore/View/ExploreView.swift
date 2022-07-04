//
//  ExploreView.swift
//  Realm-Test02
//
//  Created by KimJongHee on 2022/06/22.
//

import SwiftUI

struct ExploreView: View {
    
    @ObservedObject var viewModel = ExploreViewModel()
    
    
    
    var body: some View {
        VStack {
            SearchBar(text: $viewModel.searchText)
                .padding()
            ScrollView { 
                LazyVStack {
                    ForEach(viewModel.searchableUsers) { item in
                        NavigationLink {
                            ProfileView(user: item)

                        } label: {
                            UserRowView(user: item)
                        }
                    }
                }
            }
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
            .previewLayout(.sizeThatFits)
    }
}
