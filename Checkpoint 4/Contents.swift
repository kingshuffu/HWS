import Cocoa


enum squareRootError: Error {
    case outOfBounds, noRoot
}

func squareRoot(_ number: Int) throws -> Int {
    if number < 1 || number > 10_000 {throw squareRootError.outOfBounds}
    
    var root = 0
    /* Initial attempt
     for i in (3...number/2).reversed() {
     if i * i == number {
     root = i
     }
     }
     
     */
    
    for i in 1...100{
        if i * i == number {
            root = i
        }
    }
    
    if root != 0 {
        return root
    } else {throw squareRootError.noRoot}
}

//let rando = Int.random(in: 1...10_000)
let y = 10000
do {
    let x = try squareRoot(y)
    print(x)
} catch squareRootError.outOfBounds {
    print("Out of Bounds")
} catch squareRootError.noRoot {
    print("No root")
}

