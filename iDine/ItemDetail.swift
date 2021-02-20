//
//  ItemDetail.swift
//  iDine
//
//  Created by zm on 2/18/21.
//

import SwiftUI

struct ItemDetail: View {
    let item: MenuItem
    
    // we don't have to initialize this becuase it will have an value from env.
    // if no value exists, runtime crash
    @EnvironmentObject var order: Order
    
    var body: some View {
        VStack() {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                
                Text("Photo by \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -10, y: -5)
            }
            Text(item.description)
                .padding()
            
            Button("Order This") {
                order.add(item: item)
            }
            .font(.headline)
            .foregroundColor(.orange)
            
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        
        // Put in a nav view, so view is previewed correctly :D
        NavigationView {
            ItemDetail(item: MenuItem.example)
                .environmentObject(Order()) // inject a fake order to render the preview screen.

        }
    }
}
