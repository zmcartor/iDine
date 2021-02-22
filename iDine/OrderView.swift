//
//  OrderView.swift
//  iDine
//
//  Created by zm on 2/20/21.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    private func deleteItems(at offsets: IndexSet) {
        order.items.remove(atOffsets: offsets)
    }
    
    private var orderList: some View {
        Section {
            ForEach(order.items) { item in
                HStack {
                    Text(item.name)
                        .font(.headline)
                    Spacer()
                    Text("$\(item.price)")
                        .font(.subheadline)
                        .foregroundColor(.red)
                }
            }.onDelete(perform: deleteItems)
        }
    }
    
    private var checkoutLink: some View {
        Section {
            NavigationLink(destination: CheckoutView()) {
                Text("Place Order")
            }
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                orderList
                checkoutLink
            }
            .navigationTitle("Order")
            .listStyle(InsetGroupedListStyle())
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var order: Order = {
        let o = Order()
        o.add(item: MenuItem.example)
        return o
    }()
    
    static var previews: some View {
        OrderView()
            .environmentObject(OrderView_Previews.order)
    }
}
