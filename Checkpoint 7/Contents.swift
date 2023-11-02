import Cocoa

class Animal {
    let legs: Int
    
    init(legs: Int){
        self.legs = legs
    }
}

class Dog: Animal {
    func speak(){
        print("Woof woof")
    }
}

class Cat: Animal {
    let isTame: Bool
    
    init(isTame: Bool, legs: Int){
        self.isTame = isTame
        super.init(legs: legs)
    }
    
    func speak(){
        print("Meow meow")
    }
}

let Lion = Cat(isTame: true, legs: 4)
Lion.speak()
print(Lion.legs)
