extension Double {
    var m: Double { return self }
    var km: Double { return self*1_000.0 }
    var cm: Double { return self/100.0 }
    var mm: Double { return self/1000.0 }
    var ft: Double { return self/3.28084 }
}
let oneInch = 25.4.mm

25.4.ft

print("Three feet is \(3.ft) meters")


struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0 }
struct Rect {
    var origin = Point()
    var size = Size()
}

extension Rect{
    init(rightTop:Point, size:Size){
        let originX = rightTop.x - size.width
        let originY = rightTop.y - size.height
        self.init(origin:Point(x:originX, y:originY), size:size)
    }
}
var rect = Rect(rightTop: Point(x: 12,y: 10), size: Size(width: 5, height: 3))
rect.origin.y

extension Int {
    func repetitions(task: ()->()){
        for _ in 0..<self {
            task()
        }
    }
}
3.repetitions({
    print("hello")
})

4.repetitions{
    print("h")
}

extension Int {
    mutating func square(){
        self = self*self
    }
}
var someInt = 4
someInt.square()
//4.square()
extension Int {
    subscript(int:Int)-> Int {
        var decimalBase = 1
        var digitIndex = int
        while digitIndex > 0 {
            decimalBase *= 10
            digitIndex -= 1
        }
        return (self/decimalBase) % 10
    }
}
124241341[1]

extension Int {
    enum Kind {
        case Negative, Zero, Postive
    }
    var kind:Kind{
        switch self {
        case 0:
            return Kind.Zero
        case let x where x > 0:
            return Kind.Postive
        default:
            return Kind.Negative
        }
    }
}
1231.kind
