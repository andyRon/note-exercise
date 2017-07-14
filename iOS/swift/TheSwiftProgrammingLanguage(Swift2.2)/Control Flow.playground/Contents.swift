
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

//repeat {
//    
//} while(false)
//
//let someCharacter:Character = "e"
//
//switch someCharacter {
////case "e":
//case "a", "e", "i", "o", "u" :
//    print("\(someCharacter) is a vowel")
//case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "u", "v", "x", "y", "z" :
//    print("\(someCharacter) is a consonant")
//default:
//    print("\(someCharacter) is not a vowel or a consonant")
//    
//}
//
//
//let approximateCount = 62
//let countedThings = "moons orbiting Saturn"
//var naturalCount:String
//switch approximateCount {
//case 0:
//    naturalCount = "no"
//case 1..<5:
//    naturalCount = "a few"
//case 5..<12:
//    naturalCount = "several"
//case 12..<100:
//    naturalCount = "dozens of"
//case 100..<100:
//    naturalCount = "hundreds of"
//default:
//    naturalCount = "many"
//}
//
//print("There are \(naturalCount) \(countedThings)")
//
//
//let somePoint = (1, 1)
//switch somePoint {
//case (0, 0):
//    print("(0, 0) is at the origin")
//case (_, 0):
//    print("(\(somePoint.0), 0) is on the x-axis")
//case (0, _):
//    print("(0, \(somePoint.1)) is on the y-axis")
//case (-2...2, -2...2):
//    print("(\(somePoint.0), \(somePoint.1)) is inside the box")
//default:
//    print("(\(somePoint.0), \(somePoint.1)) is outside of the box")
//    
//}

//let another = (2, 0)
//
//switch another {
//case (let x, 0):
//    print("On the x-axis with x value of \(x)")
//case (0, let y):
//    print("On the y-axis with y value of \(y)")
//case (let x, let y):
//    print("somewhere else at (\(x), \(y))")
//}
//
//let yetAnotherPoint = (1, -1)
//switch yetAnotherPoint {
//case let(x, y) where x == y:
//    print("(\(x), \(y)) is on the line x == y")
//case let(x, y) where x == -y:
//    print("(\(x), \(y)) is on the line x == -y")
//case let(x,y):
//    print("(\(x), \(y)) is just some arbi")
//}

//let puzzleInput = "great minds think alike"
//var puzzleOutput = ""
//for c in puzzleInput.characters {
//    switch c {
//    case "a", "e", "i", "o", "u":
//        continue
//    default:
//        puzzleOutput.append(c)
//        
//    }
//}
//puzzleOutput
//
//let integerTODescribe = 5
//var description = "The number  \(integerTODescribe) is"
//switch integerTODescribe {
//case 2,3,5,7,11,13,17,19:
//    description += " a prime number, and also"
//    fallthrough
//default:
//    description += "an integer."
//}

let a = ["abcdefg", "hiljk", "mnlo"]
var b:String = ""
label_1 : for str in a {
    label_2 :for c in str.characters {
        if c == "l" {
            break label_1
        } else {
            b.append(c)
        }
    }
}

b


func greet(person:[String:String]) {
    guard let name = person["name"] else {
        return
    }
    print("Hello \(name)")
    
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    print("I hope the weather is nice in \(location).")
}

var person = ["a":1]


person["b"]

if #available(iOS 9, OSX 10.10, *) {
    
} else {
    
}

