//
//  MainView.swift
//  iDine
//
//  Created by zm on 2/20/21.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        
        TabView {
            ContentView() // an entire view is simply a tabItem here
                .tabItem {
                    Label("Menu", systemImage:  "list.dash")
                }
            
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
