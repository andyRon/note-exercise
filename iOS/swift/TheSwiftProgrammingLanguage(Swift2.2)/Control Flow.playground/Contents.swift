
for index in 1...6 {
    
}
for _ in 1..<3 {
    
}

let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
answer


// let finalSquare = 25
// var board = [Int](count:finalSquare+1, repeatedValue:0)
// board[3] = +08; board[10] = +02; board[9] = +09; board[14] = -10;
// board[6] = +11; board[19] = -11; board[22] = -02; board[24] = -08;
//
// var square = 0
// var diceRoll = 0
//var i = 0
// while square < finalSquare {
//    i += 1
//     diceRoll += 1
//     if diceRoll == 7 {
//         diceRoll = 1
//     }
//     if square < board.count {
//        square += board[square]
//     }
// 
// }
//print(i)
// print("Game Over!")

repeat {
    
} while(false)

let someCharacter:Character = "e"

switch someCharacter {
//case "e":
case "a", "e", "i", "o", "u" :
    print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "u", "v", "x", "y", "z" :
    print("\(someCharacter) is a consonant")
default:
    print("\(someCharacter) is not a vowel or a consonant")
    
}


let approximateCount = 62
let countedThings = "moons orbiting Saturn"
var naturalCount:String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<100:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}

print("There are \(naturalCount) \(countedThings)")


let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("(0, 0) is at the origin")
case (_, 0):
    print("(\(somePoint.0), 0) is on the x-axis")
case (0, _):
    print("(0, \(somePoint.1)) is on the y-axis")
case (-2...2, -2...2):
    print("(\(somePoint.0), \(somePoint.1)) is inside the box")
default:
    print("(\(somePoint.0), \(somePoint.1)) is outside of the box")
    
}





