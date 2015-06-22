// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

println("come on! andy")

let myvalue = "dd"


let floatval : Float = 4

let label = "The width is"
let width = 12
let widthLabel = label + String(width)




widthLabel.hashValue
"a".hashValue
"a".hashValue
"a".generate()
"b".hashValue




let appleSummary = "I have \(width) d d"

let hello = "hello \(floatval)"

var shappingList = ["catfish","water"]
shappingList[1] = "bottle of water"

shappingList.append("df")
shappingList.count
shappingList.description
appIsDaemon
appleMenuFolderIconResource





var occupations = [ "Malcolm":"Captain","Kaylee":"Mechanic"]
occupations["Jayne"] = "Public Relations"
occupations.keys
occupations
var tmp = ""

for (k, v) in occupations{
  tmp += k
}

for k in occupations.keys{
    
}
for v in occupations.values{
    
}

let dic = ["city":"xinghua", "shengfen":"jiangsu"]


let emptyArray = [String]()
let emptyDictionary = [String:Float]()



shappingList = []
occupations = [:]

let individualScores = [75,43,102,87,12]
var teamScore = 0
for score in individualScores{
    if score > 50{
        teamScore += 3
    }else{
        teamScore += 1
    }
}
teamScore




var optionalString: String? = "hello"
optionalString = nil
var optionalName: String? = "John Appleseed"
optionalName = nil
var greeting = "Hello!"
if let name = optionalName{
    greeting = "Hello,\(name)"
}
greeting


let vegetable = "red pepper"
switch vegetable{
case "celery":
    let vegetableComment = "Add some raisins and make ants on a log."
case "cucumber","watercress":
    let vegetableComment = "That would make a good tea sandwich"
case let a where a.hasSuffix("pepper"):
    let vegetableComment = "Is it a spicy \(a)?"
default:
    let vegetableComment = "Everything tastes good in soup."
}



//vegetableComment

var firstForloop = 0
for i in 0...4 {
    firstForloop += i
}
firstForloop

func greet(name:String, day:String) -> String{
    return "Hello \(name), today is \(day)."
}
greet("Bob","Tuesday")

func calculateStatistics(scores:[Int]) ->(min:Int,max:Int,sum:Int){
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    for score in scores{
        if score > max{
            max = score
        }else if score < min {
            min = score
        }
        sum += score
    }
    return (min,max,sum)
}
var aaa = calculateStatistics([1,2,4])



func sumOf(numbers: Int...) -> Int{
    var sum = 0
    for number in numbers{
        sum += number
    }
    return sum
}
sumOf(23,123,12)

func makeIncrementer() -> (Int -> Int){
    func addOne(number:Int) -> Int {
        return 1 + number
    }
    return addOne
}

//函数作为参数



class Shape{
    var numberOfSides = 0
    func simpleDescription() -> String{
        return "A shape with \(numberOfSides) sides."
    }
}

var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()

class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    init(name: String){
        self.name = name
    }
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

class Square: NamedShape {
    var sideLength: Double
    init(sideLength:Double,name:String){
        self.sideLength = sideLength
        super.init(name:name)
        numberOfSides = 4
    }
    func area() -> Double{
        return sideLength * sideLength
    }
    override func  simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
    
}
let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()
test.name

class Circle: NamedShape{
    
}


class EquilateralTriangle: NamedShape{
    var sideLength: Double = 0.0
    
    init(sideLength:Double, name:String){
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    var perimeter: Double{
        get{
            return 3.0*sideLength
        }
        set{
            sideLength = newValue/3.0
        }
    }
    override func  simpleDescription() -> String {
        return "A equilateral triagle with sides of length \(sideLength)."
    }
}
//var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
//triangle.perimeter
//triangle.perimeter = 9.9
//triangle.sideLength

let t = EquilateralTriangle(sideLength:5.6,name:"my triangle")
t.numberOfSides
t.perimeter
t.simpleDescription()



class TriangleAndSquare {
    var triangle: EquilateralTriangle{
        willSet{
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square{
        willSet{
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size:Double, name:String){
        square = Square(sideLength:size, name:name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
triangleAndSquare.square.sideLength
triangleAndSquare.triangle.sideLength


class Counter{
    var count: Int = 0
    func incrementBy(amount: Int, numberOfTimes times:Int){
        count += amount * times
    }
}
var counter = Counter()
counter.incrementBy(2, numberOfTimes: 7)

let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
//let sideLength = optionalSquare?.sideLenth


//枚举和结构体
//enum Rank: Int{
//    case Ace = 1
//    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
//    case Jack, Queen, King
//    func simpleDescription() -> String{
//        switch self{
//        case .Ace:
//                return "ace"
//        case .Jack:
//                return "jack"
//        case .Queen:
//                return "queen"
//        case .King:
//                return "king"
//        default :
//            return String(self.rawValue())
//        }
//    }
//}
//let ace = Rank.Ace
//let aceRawValue = ace.rawValue()
//
//enum Suit{
//    case Spades, Hearts, Diamonds, Clubs
//    func simpleDescription()->String{
//        switch self{
//        case .Spades:
//            return "spades"
//        case .Hearts:
//            return "hearts"
//        case .Diamonds:
//            return "diamonds"
//        case .Clubs:
//            return "clubs"
//            
//        }
//    }
//}
//let hearts = Suit.Hearts
//let heartsDescription = hearts.simpleDescription()
//
//struct Card {
//    var rank: Rank
//    var suit: Suit
//    func simpleDescription() -> String {
//        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
//    }
//}
//
//let threeOfSpades = Card(rank: .Three, suit: .Spades)
//let threeOfSpadesDescription = threeOfSpades.simpleDescription()
//
//

enum ServerResponse{
    case Result(String, String)
    case Error(String)
}
let success = ServerResponse.Result("6:00 am", "8:09 pm")
let failure = ServerResponse.Error("out of cheese")

switch success{
case let .Result(sunrise, sunset):
    let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)."
case let .Error(error):
    let serverResponse = "Failure... \(error)"
}


extension String {
    var banana : String {
//        let shortName = String(dropFirst(characters))
        let shortName = "andy"
        return "\(self) \(self) Bo B\(shortName) Banana Fana Fo F\(shortName)"
    }
}

let bananaName = "Jimmy".banana








