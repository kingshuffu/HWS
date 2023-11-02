import Cocoa

struct Car {
    var gear: Int
    let seats: Int
    let model: String
    
    init(model: String, seats: Int, gear: Int = 0){
        self.model = model
        self.seats = seats
        self.gear = 0
        
    }
    
    mutating func upShift(){
        if self.gear < 10 {
            self.gear += 1
        } else {
            print("Max gear")
        }
    }
    
    mutating func downShift(){
        if self.gear > 0 {
            self.gear -= 1
        } else {
            print("Min gear")
        }
    }
    
    
}
    

var myTesla = Car(model: "2020", seats: 4)

print(myTesla.gear)
myTesla.upShift()
print(myTesla.gear)
myTesla.downShift()
myTesla.downShift()
