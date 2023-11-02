import Cocoa

func randoInt(nums: [Int]? ) -> Int { guard let nums = nums else { return Int.random(in: 1...100)}; return nums.randomElement() ?? Int.random(in: 1...100)}
 
let randomInts: [Int] = []

let num = randoInt(nums: randomInts)
print(num)

