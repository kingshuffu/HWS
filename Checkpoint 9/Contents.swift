import Cocoa

let opposites = [
    "Mario" : "Wario",
    "Luigi" : "Waluigi"
]

let peachOpposite = opposites["Peach"]

if let marioOpposite = opposites["Mario"] {
    print ("Mario's opposite is \(marioOpposite)")
}

var username: String? = nil

if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("No name")
}

func square(number: Int) -> Int {
    number * number
}

var number: Int? = nil
//number = 5

//shadowing
if let number = number {
    print(square(number: number))
}

print("----------------")

func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")
        return
    }
    
    print("\(number) x \(number) = \(number * number)")
}

var myVar: Int? = 3

/*
if let unwrapped = myVar {
    // Run if myVar has Value inside
}

guard let unwrapped = myVar else {
    // Run if myVar doesn't have a value inside
}

*/

printSquare(of: nil)

print("----------------")

//nil coalescing
let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

let new = captains["Serenity"] ?? "N/A"

let tvShows = ["batman", "arrow", "the glory"]
let favorite = tvShows.randomElement() ?? "None"

struct Book {
    let title: String
    let author: String?
    
}

let book = Book(title: "Percy Jackson", author: nil)
let author = book.author ?? "Anon"
print(author)

let input = ""
let number2 = Int(input) ?? 0
print(number2)
 
print("-----------------")

var names = ["Arya", "Ayo", "Sonic", "Shadow"]
//names = []
let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")

struct Book2 {
    let title: String
    let author: String?
}

var book2: Book2? = nil
let author2 = book2?.author?.first?.uppercased() ?? "A"
print(author2)

enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
}

let user = (try? getUser(id: 23)) ?? "Anonymous"
print(user)


//Checkpoint 9
func randoInt(nums: [Int]? ) -> Int { guard let nums = nums else { return Int.random(in: 1...100)}; return nums.randomElement() ?? Int.random(in: 1...100)}
 
let randomInts: [Int] = []

let num = randoInt(nums: randomInts)
print(num)

