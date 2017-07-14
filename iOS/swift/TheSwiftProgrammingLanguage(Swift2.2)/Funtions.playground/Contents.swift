
func sayHello(personName:String) -> String {
    let greeting = "Hello, \(personName)!"
    return greeting
}
func sayHelloAgain(personName:String) ->String {
    return "Hello again, \(personName)"
}
func halfOpenRangeLength(start:Int, end:Int) -> Int {
    return end - start
}

func sayHelloWorld() -> String {
    return "hello world!"
}

func sayHello(personName:String, alreayGreeted:Bool) {
    if alreayGreeted {
        sayHelloAgain(personName)
    } else {
        sayHello(personName)
    }
}

sayHello("andy", alreayGreeted: true)

func sayGoodBye(personName:String) {
    print("GoodBye, \(personName)")
}

//var a = sayGoodBye("andy")

func printAndCount(stringToPrint:String) -> Int {
    print(stringToPrint)
    return stringToPrint.characters.count
}

func printWithoutCount(stringToPrint:String){
    printAndCount(stringToPrint)
}

printAndCount("abc")

printWithoutCount("efg")

func maxMin(array:[Int]) -> (min:Int, Max:Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
var array = [2,4,5, 1, 6, 9, 3]

var tu = maxMin(array)
tu.Max
tu.0
array[1..<array.count]

func maxMin2(array:[Int]) -> (min:Int, Max:Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

//maxMin([])
maxMin2([])

if let bounds = maxMin2([1,3]) {
    print("abc")
}

func someFunction(firstParameterName: Int, secondParameterName: Int) {
    
}
someFunction(1, secondParameterName: 2)

func someFunction(externalParameterName loaclParameterName:Int) {
    
}
someFunction(externalParameterName: 1)

func sayHello(to person:String, and anotherPerson:String) -> String {
    return ""
}
sayHello(to:"", and: "")

func someFunction2(firstParameterName: Int, _ secondParameter: Int) {
    
}
someFunction2(1, 2)

func someFunction3(parameterName: Int = 2, s secondParameter:Int = 3 ) {
    
}
someFunction3(3, s: 4)

func arithmeticMean(numbers:Double...)-> Double {
    var total:Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(2,3,4,5,6,1,22)

func alignRight(var string:String, totalLength:Int, pad:Character) ->String {
    let amountToPad = totalLength - string.characters.count
    if amountToPad < 1 {
        return string
    }
    let padString = String(pad)
    for _ in 1...amountToPad {
        string = padString + string
    }
    return string
}

alignRight("andyron", totalLength: 20, pad: "_")


func swapTwoInts(inout a:Int, inout b:Int)
//    -> String
{
    let temp = a
    a = b
    b = temp
//    return ""
}

var someInt = 2
var anotherInt = 5
swapTwoInts(&someInt, b: &anotherInt)

someInt


func addTwoInts(a: Int, b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(a: Int, b: Int) -> Int {
    return a*b
}

var addFunction:(Int, Int)->Int = addTwoInts
var multiplyFunction = multiplyTwoInts
multiplyFunction(2, b: 4)

func printMathFunction(mathFunction:(Int, Int)->Int, _ a:Int, _ b:Int) {
    print("Return: \(mathFunction(a, b))")
}

printMathFunction(addTwoInts, 2, 6)

func stepForward(input: Int) -> Int {
    return input + 1
}
func stepBackward(input: Int) -> Int {
    return input - 1
}
func chooseStep(backwards: Bool) -> (Int)->Int {
    return backwards ? stepBackward : stepForward
}
var currentValue = 3
let moveNearerToZero = chooseStep(currentValue > 0)
print("Counting to zero")
while currentValue != 0 {
    print("\(currentValue)...")
    currentValue = moveNearerToZero(currentValue)

}


func chooseStep2(backwards: Bool) -> (Int)->Int {
    func stepForward(input: Int) -> Int {
        return input + 2
    }
    func stepBackward(input: Int) -> Int {
        return input - 2
    }
    return backwards ? stepBackward : stepForward
}

chooseStep2(false)(4)


