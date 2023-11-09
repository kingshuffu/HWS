//
//  Order.swift
//  CupcakeCorner
//
//  Created by Ayo Shafau on 11/8/23.
//

import SwiftUI

class Order: ObservableObject {

    static let types = ["Vanilla", "Strawberry", "Chocolate"]
    
    @Published var type = 0
    @Published var quantity = 3
    
    @Published var specialRequestEnabled = false{
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    
    @Published var extraFrosting = false
    @Published var addSprinkles = false
    
    @Published var name = ""
    @Published var streetAdress = ""
    @Published var city = ""
    @Published var zip = ""
    
    var hasValidAdress: Bool {
        if name.isEmpty || streetAdress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
        
        return true
    }
    
    var cost: Double {
        // $2 per cake
        var cost = Double(quantity) * 2
        
        //complicated cakes cost more
        cost += (Double(type) / 2)
        
        // $1/cake for extra frosting
        if extraFrosting {
            cost += Double(quantity)
        }
        
        if addSprinkles {
            // $0.50/cake for sprinkles
            cost += Double(quantity) / 2
        }
        
        return cost
    }
}
