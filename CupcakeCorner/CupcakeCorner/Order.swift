//
//  Order.swift
//  CupcakeCorner
//
//  Created by Ayo Shafau on 11/8/23.
//

import SwiftUI

class ClassOrder: ObservableObject, Codable {
    @Published var order: Order
    
    init(){ 
        order = Order(type: 1, quantity: 3, extraFrosting: false, addSprinkles: false, name: "", streetAdress: "", city: "", zip: "")

        
    }
    
}
    
    struct Order : Codable {
        enum CodingKeys: CodingKey {
            case type, quantity, extraFrosting, addSprinkles, name, streetAddress, city, zip
        }
        
        static let types = ["Vanilla", "Strawberry", "Chocolate"]
        
        var type = 0
        var quantity = 3
        
        var specialRequestEnabled = false{
            didSet {
                if specialRequestEnabled == false {
                    extraFrosting = false
                    addSprinkles = false
                }
            }
        }
        
        var extraFrosting = false
        var addSprinkles = false
        
        var name = ""
        var streetAdress = ""
        var city = ""
        var zip = ""
        
        var hasValidAdress: Bool {
            
            
            if name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || streetAdress.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || city.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || zip.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
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
        
//        init() { }
        
//        func encode(to encoder: Encoder) throws {
//            var container = encoder.container(keyedBy: CodingKeys.self)
//            
//            try container.encode(type, forKey: .type)
//            try container.encode(quantity, forKey: .quantity)
//            try container.encode(extraFrosting, forKey: .extraFrosting)
//            try container.encode(addSprinkles, forKey: .addSprinkles)
//            try container.encode(name, forKey: .name)
//            try container.encode(streetAdress, forKey: .streetAddress)
//            try container.encode(city, forKey: .city)
//            try container.encode(zip, forKey: .zip)
//        }
//        
//        
//        required init(from decoder: Decoder) throws {
//            let container = try decoder.container(keyedBy: CodingKeys.self)
//            type = try container.decode(Int.self, forKey: .type)
//            quantity = try container.decode(Int.self, forKey: .quantity)
//            
//            extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
//            addSprinkles = try container.decode(Bool.self, forKey: .addSprinkles)
//            
//            name = try container.decode(String.self, forKey: .name)
//            streetAdress = try container.decode(String.self, forKey: .streetAddress)
//            city = try container.decode(String.self, forKey: .city)
//            zip = try container.decode(String.self, forKey: .zip)
//        }
        
    }
    
