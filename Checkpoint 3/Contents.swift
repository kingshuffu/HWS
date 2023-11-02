import Cocoa

for number in 1...100 {
    if number % 3 == 0 && number % 5 == 0 {
        print("fizzBuzz")
    } else if number % 5 == 0  {
        print("buzz")
    } else if number % 3 == 0 {
        print("fizz")
    } else {
        print(number)
    }
}
