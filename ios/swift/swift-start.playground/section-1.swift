// Playground - noun: a place where people can play

println("hello,world")

let consant = 23
var variable = 334

let implicitInteger = 10
let explicitDouble: Double = 20

let explicitFloat: Float = 4

let label = "andy ron"
let width = 54
let widthLabel = label + String(width)

//let ww  = label + width

let widthLabel2 = " my name is \(label)."

var shoppingList = ["catfish","water","tulips","blue paint"]
shoppingList[1]

var occupations = ["Malcolm":"Captain", "Kaylee":"Mechanic",]

occupations["Jayne"] = "Public Relations"

//let emptyArray = String[]()
//let emptyDictionary = Dictionary<String,Float>()
//
//let emptyArray2 = []
//let empty Dictionary2 = [:]

let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores{
    if score > 50 {
        teamScore += 3
    }else{
        teamScore += 1
    }
}
teamScore

var optionalString: String? = "hello"
optionalString == nil
var optionalName: String? = "John Appleseed"
optionalName = nil
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}else{
    greeting = "hi,man"
}

let vegetable = "red pepper"
switch vegetable{
    case "celery":
        let vegetableComment = "Add some raisins and make ants on a log."
    case "cucumber", "watercress":
        let vegetableComment = "That would make a good tea sandwich."
    case let x where x.hasSuffix("pepper"):
        let vegetableComment = "Is it a spicy \(x)?"
    default:
        let vegetalbeComment = "Everything tastes good in soup."
    
}


let interestingNumbers = [
    "Prime":[2,3,5,7,11,13],
    "Fibonacci":[1,1,2,3,5,8],
    "Square":[1,4,9,16,25],
]
var largest = 0
for (kind, numbers) in interestingNumbers{
    for number in numbers{
        if number > largest{
            largest = number
        }
    }
}
largest


var n = 2
while n < 100 {
    n = n*2
}
n

var m = 2
do{
    m = m*2

}while m<100
m


var firstForLoop = 0
for i in 0..<3 {
    firstForLoop += i
}
firstForLoop

var secondForLoop = 0
for var i=0;i<3;++i{
    secondForLoop += 1
}
secondForLoop


//函数 闭包
func greet(name: String, day: String) -> String{
    return "hello \(name), today is \(day)."
}
greet("Bob","Tuesday")

func greet2(name:String, eat:String) ->String{
    return "hello \(name), food id \(eat)."
}
greet2("andy", "Hamburg")


func getGasPrices() -> (Double,Double,Double){
    return(3.59,3.69,3.89)
}
var a = getGasPrices()
println(a)

func sumOf(numbers:Int...) -> Int{
    var sum = 0
    for number in numbers{
        sum += number
    }
    return sum
}
sumOf()
sumOf(23,134,3,55)

func average(numbers:Int...) ->Double{
    var ave = 0,sum = 0,i = 0
    for num in numbers{
        sum += num
        i++
    }
//    ave = sum/i
    return 1.2;
}


func makeIncrementer() -> (Int -> Int){
    func addOne(number:Int) -> Int{
        return 1+number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)


func hasAnyMatches(list:[Int], condition:Int->Bool)->Bool{
    for item in list{
        if condition(item){
            return true
        }
    }
    return false
}
func lessThanTen(number:Int)->Bool{
    return number < 10
}
var numbers = [20,11,2,111]

println( hasAnyMatches(numbers, lessThanTen))

let ab=12

numbers.map({
    (number:Int) -> Int in
    let result = 3*number
    return result
})


func hasAnyMatches2(list:[Int], condition:Int->Bool)->Int{
    for item in list{
        if condition(item){
            return 0
        }
    }
    return 1
}

//func lessThanTen2(number:Int)->Bool{
//    if(number/2) {
//      return true;
//    }else return false
//}

//println(hasAnyMatches2(numbers, lessThanTen2))

//sort([1,2,3,4,12,5])

let explic : Double  = 80






