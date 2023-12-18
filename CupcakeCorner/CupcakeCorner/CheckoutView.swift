//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Ayo Shafau on 11/9/23.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: ClassOrder
    
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    @State private var failedConnection = false
    
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in 
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
                
                Text("Your total is \(order.cost, format: .currency(code: "USD"))")
                    .font(.title)

                Button("Place Order") {
                    Task{
                        
                        await placeOrder()
                    }
                }
                    .padding()

            }
        }
        .navigationTitle("Check Out")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Thank you", isPresented: $showingConfirmation){
            Button("OK"){ }
        } message: {
            Text(confirmationMessage)
        }
        .alert("Uh Oh", isPresented: $failedConnection){
            Button("OK"){ }
        } message: {
            Text("There has been a problem placing your order 😔")
        }
    }
    
    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url:url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            //handle the result
            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            confirmationMessage = "Your order for \(decodedOrder.quantity)x \(Order.types[decodedOrder.type].lowercased()) cupcakes is on its way!"
            showingConfirmation = true
        } catch {
            failedConnection = true
            print("Checkout failed")
        }
        
    }
}

#Preview {
    CheckoutView(order: ClassOrder())
}
