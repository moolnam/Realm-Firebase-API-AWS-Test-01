//
//  ContentView.swift
//  Realm-Test02
//
//  Created by KimJongHee on 2022/06/21.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    
    @ObservedResults(Country.self) var country
    
    var body: some View {
        Text(country.description)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
