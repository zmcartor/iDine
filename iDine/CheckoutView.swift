//
//  CheckoutView.swift
//  iDine
//
//  Created by zm on 2/21/21.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    let paymentTypes = ["BTC", "Credit", "cash lol"]
    
    //picker state
    @State private var paymentType = "whatever"
    
    var body: some View {
        NavigationView {
            VStack {
                Section() {
                    Picker("How do you wanna pay?", selection: $paymentType) {
                        ForEach(paymentTypes, id: \.self) { type in
                            Text(type)
                        }
                    }
                }
            }.navigationTitle("Payment")
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
            .environmentObject(Order())
    }
}
