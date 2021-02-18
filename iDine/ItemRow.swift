//
//  ItemRow.swift
//  iDine
//
//  Created by zm on 2/18/21.
//

import SwiftUI

struct ItemRow: View {
    
    let item: MenuItem
    var body: some View {
        HStack {
            Image(item.thumbnailImage)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.blue, lineWidth: 3))
            
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                
                Text("$\(item.price)")
                    .font(.subheadline)
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
