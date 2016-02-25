
let explicitVal:Float = 4

let label = "sliderLabel";

let lf = label + String(explicitVal)

let emptyArray = [String]()
let emptyDictionary = [String:Float]();

var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)" }

let vegetable = "cucumber"
var c:String;
switch vegetable {
case "banana":
    c = "b";
case "apple","potato":
    c = "two";
case let x where x.hasSuffix("ber"):
    c = "suffix is \(x)";
default:
    c = "default";
    
    
}
print(c)

func calculate(scorces:[Int])->(mix:Int, max:Int, sum:Int) {
    
    return (1, 12, 24)
}

let numbers = [2,5,1,3,4]
let res = numbers.map({ (number: Int) -> Int in let result = 3 * number; return result
})

let res2 = numbers.map({ (number:Int) -> String in number%2 == 0 ? "even" : "odd"})
let res3 = numbers.sort{$0>$1}


class EquilateralTriangle {
    var sideLength: Double = 0.0
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
//        super.init(name: name)
//        numberOfSides = 3
    }
    var perimeter: Double { get {
        return 3.0 * sideLength }
        set {
            sideLength = newValue / 3.0
        } }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)
print(triangle.perimeter)