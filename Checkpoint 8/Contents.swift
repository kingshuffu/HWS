import Cocoa

protocol Building {
    var rooms: Int { get set }
    var cost: Int { get set }
    var owner: String { get set }
    func summary()
}

struct House: Building {
    var rooms: Int
    var cost: Int
    var owner: String
    
}

extension House {
    func summary() {
        print("This house is owned by \(owner) and cost \(cost). There are \(rooms) rooms")
    }
}

struct Office: Building {
    var rooms: Int
    var cost: Int
    var owner: String
    
}

extension Office {
    func summary() {
        print("This office is owned by \(owner) and cost \(cost). There are \(rooms) rooms")
    }
}



var hotblox = House(rooms: 4, cost: 2500, owner: "RPM")
hotblox.summary()

let beep = Office(rooms: 10, cost: 400000, owner: "Tavistock")
beep.summary()
hotblox.rooms = 5
hotblox.summary()
