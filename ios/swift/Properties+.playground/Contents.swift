struct FixedLengRange {
    var firstValue: Int
    let length: Int
}

var one = FixedLengRange(firstValue: 1, length: 5)

one.firstValue = 2

let two = FixedLengRange(firstValue: 2, length: 8)

//two.firstValue = 3


class DataImporter {
    var fileName = "data.txt"
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}

let manager = DataManager()

manager.data.append("adf")

manager.importer.fileName



struct Point{
    var x = 0.0, y = 0.0
}

struct Size {
    var w = 0.0 , h = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center : Point {
        get{
            let centerX = origin.x + size.w/2
            let centerY = origin.y + size.h/2
            return Point(x:centerX, y:centerY)
        }
        set{
            origin.x = newValue.x - size.w/2
            origin.y = newValue.y - size.h/2
        }
    }
}
var rect = Rect()
rect.size = Size(w: 10, h: 10)
rect.center.x
rect.center.y
rect.center = Point(x:15,y:15)
rect.origin.x

print("adfsa")
print("dfbg")


class StepCounter {
    var totalSteps: Int = 0 {
        willSet {
            print("totalSteps is \(newValue)")
        }
        didSet {
            print("The lasted totalSteps is \(totalSteps). The olded totalSteps is \(oldValue)")
        }
    }
    
}
var step = StepCounter()

step.totalSteps = 100

struct SomeStruct {
    static var storedTypeProperty = "property"
    static var computedTypeProperty:Int{
        return 123
    }
}
enum SomeEnum {
    static var storedTypeProperty = "property2"
    static var computedTypeProperty:Int{
        return 789
    }
}
class SomeClass {
    static var storedTypeProperty = "property3"
    static var computedTypeProperty:Int{
        return 789
    }
    class var overrideableComputedTypeProperty:Int{
        return 567
    }
}
print(SomeClass.computedTypeProperty)

//SomeClass.computedTypeProperty = 444
SomeClass.storedTypeProperty = "not property"
print(SomeClass.storedTypeProperty)
print(SomeStruct.storedTypeProperty)
print(SomeEnum.storedTypeProperty)





