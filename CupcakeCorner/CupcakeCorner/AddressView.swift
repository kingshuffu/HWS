//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Ayo Shafau on 11/9/23.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: ClassOrder
    @State private var isValid = true
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.name)
//                    .onChange(of: order.name){ newValue in
//                        //checking if trimmed array is not empty
//                        isValid = !newValue.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
//                    }
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
        AddressView(order: ClassOrder())
    }
}
