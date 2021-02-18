//
//  ContentView.swift
//  iDine
//
//  Created by zm on 2/17/21.
//

import SwiftUI

struct ContentView: View {
    
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        NavigationView {
            List {
                // populate the list dynamically
                ForEach(menu) { menuSection in
                    Section(header: Text(menuSection.name)) {
                        // nest the items within each section
                        ForEach(menuSection.items) { item in
                            ItemRow(item: item)
                        }
                    }
                }
            }.navigationTitle("Hellos")
            .listStyle(GroupedListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
