//
//  ItemRow.swift
//  iDine
//
//  Created by zm on 2/18/21.
//

import SwiftUI

struct ItemRow: View {
    let colors: [String: Color] = ["D": .purple, "G": .black,
   "N": .red, "S": .blue, "V": .green]
    
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
            
            Spacer() // automatically takes up free space
            
            // id makes the strings value the identifier
            ForEach(item.restrictions, id: \.self) { r in
                Text(r)
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(5)
                    .background(colors[r, default: .green])
                    .clipShape(Circle())
                    .foregroundColor(.white)
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
