//collection types
var shoppingList: [String] = ["Eggs", "Milk"]
shoppingList.append("beg")
shoppingList += ["Baking Powder"]
shoppingList.count
shoppingList[1...3] = ["sa","bs"]
shoppingList.insert("Maple Syrup", atIndex: 0)

shoppingList[1]

for (index, value) in enumerate(shoppingList){
    println("Item \(index + 1): \(value)")
}

var someInts = [Int]()

someInts.count

var threeDoubles = [Double](count:3,repeatedValue:0.0)

var anotherThreeDoubles = Array(count:3,repeatedValue:2.5 )


var airports:[String:String] = ["TYO":"Tokyo","DUB":"Dublin"]
airports.count

airports.updateValue("Dublin Internation", forKey:"DUB")
airports.count
airports["SH"] = "ShangHai"
airports["BJ"] = "BeiJing"

let airportNames = Array(airports.values)

airportNames

var nameOfIntegers = Dictionary<Int, String>()
nameOfIntegers[12] = "tt    "
nameOfIntegers = [:]

let base = 3
let power = 10
var answer = 1
for _ in 1...power{
    answer *= base
}
answer


//Snakes and Ladders
//let finalSquare = 25
//var board = [Int](count:finalSquare+1, repeatedValue: 0)
//board[03] = +08; board[06] = +11; board[09] = +09;board[10] = +02
//board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
//
//var square = 0
//var diceRoll = 0
//while square < finalSquare{
//    if ++diceRoll == 7{ diceRoll = 1}
//    square += diceRoll
//    if square < board.count{
//        square += board[square]
//    }
//}
//println("Game over!")

// switch  元组
let samePoint = (1,1)
switch samePoint{
case (0, 0):
    println()
case (_, 0):
    println()
case (0, _):
    println()
case (-2...2, -2...2):
    println()
default:
    println()
}


let puzzleInput = "great minds think alike"
var puzzleOutput = ""
for character in puzzleInput{
    switch character{
    case "a","e","i","o","u"," ":
        break
    default:
        puzzleOutput.append(character)
    }
}
println(puzzleOutput)

let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe{
case 2,3,5,7,11,13,17,19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}


//Snakes and Ladders++
let finalSquare = 25
var board = [Int](count:finalSquare+1, repeatedValue: 0)
board[03] = +08; board[06] = +11; board[09] = +09;board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

var square = 0
var diceRoll = 0
gameLoop: while square != finalSquare{
//    println(square)
    if ++diceRoll == 7{ diceRoll = 1}
    switch square + diceRoll{
    case finalSquare:
        break gameLoop
    case let newSquare where newSquare > finalSquare:
        continue gameLoop
    default:
       square += diceRoll
       square += board[square]
    }
}






