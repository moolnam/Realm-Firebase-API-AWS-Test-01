//
//  ContentView.swift
//  Realm-Test02
//
//  Created by KimJongHee on 2022/06/21.
//

import SwiftUI
import RealmSwift

struct ContentView2: View {
    
    @ObservedResults(Country.self) var country
    
    var body: some View {
        Text(country.description)
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
