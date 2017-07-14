
struct  Fahrenheit {
    var temperature: Double
    init(){
        temperature = 32.0
    }
}
var f = Fahrenheit()
f.temperature

struct Celsius {
    var temperatureInCelsius:Double = 0.0
    init(fromFahrenheit fahrenhet:Double){
        temperatureInCelsius = (fahrenhet - 32.0)/1.8
    }
    init(fromKelvin kelvin:Double){
        temperatureInCelsius = kelvin - 273.15
    }
}

let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
let freezingPointOfWater = Celsius(fromKelvin: 273.15)

struct Celsius2 {
    var temperatureInCelsius:Double = 0.0

}
let t = Celsius2(temperatureInCelsius: 3)

struct Color {
    let red, green, blue:Double
    init(red:Double, green:Double, blue:Double){
        self.red = red
        self.blue = blue
        self.green = green
    }
    init(white:Double){
        red = white
        blue = white
        green = white
    }
}
//let magenta = Color(1.0, 0.1, 0.2)
let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)

struct Celsius3 {
    var temperatureInCelsius:Double = 0.0
    init(fromFahrenheit fahrenhet:Double){
        temperatureInCelsius = (fahrenhet - 32.0)/1.8
    }
    init(fromKelvin kelvin:Double){
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius:Double){
        temperatureInCelsius = celsius
    }
}

class SurveyQuestion{
    var text:String
    var response:String?
    init(text:String){
        self.text = text
    }
    func ask(){
        print(text)
    }
}
var q = SurveyQuestion(text: "Do you like cheese?")
q.ask()
class SurveyQuestion2{
    let text:String
    var response:String?
    init(text:String){
        self.text = text
    }
    func ask(){
        print(text)
    }
}

struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    init(){}
    init(origin:Point, size:Size){
        self.origin = origin
        self.size = size
    }
    init(center:Point, size:Size){
        let originX = center.x - size.width/2
        let originY = center.y - size.height/2
        self.init(origin:Point(x:originX, y:originY),size:size)
    }
}

var rect = Rect()
var rect2 = Rect(origin: Point(x: 1, y: 2), size: Size(width: 10, height: 12))
class Super {
    
}
class Sub:Super {
    override init(){
        super.init()
    }
    convenience init(a:Int){
        self.init()
    }
}

class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
}
class Bicycle: Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}
var b =  Bicycle()

class Food {
    var name:String
    init(name:String){
        self.name = name
    }
    convenience init(){
        self.init(name: "[Unnamed]")
    }
}
let namedMeat = Food(name: "Bacon")
namedMeat.name

class RecipeIngredient:Food{
    var quantity:Int
    init(name:String, quantity:Int){
        self.quantity = quantity
        super.init(name:name)
    }
    override convenience init(name:String){
        self.init(name:name, quantity: 1)
    }
}
var one = RecipeIngredient()    // 默认构造器是怎么继承的？？
one.quantity
one.name

class ShoppingListItem: RecipeIngredient {
    var purchased = false
    var description:String{
        var output = "\(quantity) x \(name.lowercaseString)"
        output += purchased ? " purchased" : " unpurchased"
        return output
    }
}


