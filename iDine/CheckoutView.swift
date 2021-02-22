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
    
    let tipAmounts = [0, 10, 15, 20, 25]
    //picker state
    @State private var paymentType = "whatever"
    @State private var tipAmount = 0
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var showingPaymentAlert = false
    
    var body: some View {
        Form {
            loyaltyPaymentSection
            tipPickerSection
            confirmSection
        }
        .alert(isPresented: $showingPaymentAlert, content: {
            Alert(title: Text("order confirmed"),
                  message: Text("total was free"),
                  dismissButton: .default(Text("Ok")))
        })
    }
    
    private var confirmSection: some View {
        Section(header: Text("Total: $00")) {
            
            Button("Place Order") {
                showingPaymentAlert.toggle()
            }
        }
    }
    
    private var tipPickerSection: some View {
        
        Section(header: Text("Add a tip")) {
            Picker("Percentage:", selection: $tipAmount) {
                ForEach(tipAmounts, id: \.self) { a in
                    Text("\(a)%")
                }
            }.pickerStyle(SegmentedPickerStyle())
        }
    }
    
    private var loyaltyPaymentSection: some View {
        Section() {
            // animation on binding causes smooth appearence of the toggle
            Toggle("Add a loyalty card", isOn: $addLoyaltyDetails.animation())
            
            if addLoyaltyDetails {
                TextField("Enter your id", text: $loyaltyNumber)
            }
            
            Picker("How do you wanna pay?", selection: $paymentType) {
                ForEach(paymentTypes, id: \.self) { type in
                    Text(type)
                }
            }
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
            .environmentObject(Order())
    }
}
