//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Ayo Shafau on 11/9/23.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.name)
                TextField("Street Adress", text: $order.streetAdress)
                TextField("City", text: $order.city)
                TextField("Zip", text: $order.zip)
            
            }
            
            Section{
                NavigationLink{
                    CheckoutView(order: order)
                } label: {
                    Text("Check out")
                }
            }
            .disabled(!order.hasValidAdress)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView{
        AddressView(order: Order())
    }
}
