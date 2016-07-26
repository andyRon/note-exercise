
struct FixedLengthRange {
    var firstValue:Int
    var length:Int
}

struct FixedLengthRange2 {
    var firstValue:Int
    var length:Int
}

let f2 = FixedLengthRange2(firstValue: 3,length: 5)
//f2.firstValue = 1
var f1 = FixedLengthRange(firstValue: 1, length: 3)
f1.firstValue = 2

class FixedLengthRange_c {
    var firstValue:Int = 0
    var length:Int = 0
}

let f_c = FixedLengthRange_c()
f_c.firstValue = 2

class DataImporter {
    var fileName = "data.txt"
}
class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}

let manager = DataManager()
manager.data.append("data1")

manager

manager.importer.fileName


struct  Point {
    var x = 0.0
    var y = 0.0
}

struct  Size {
    var width = 0.0
    var height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center:Point {
        get{
            let centerX = origin.x + (size.width/2)
            let centerY = origin.y + (size.height/2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter){
            origin.x = newCenter.x - (size.width/2)
            origin.y = newCenter.y - (size.height/2)
        }
    }
}
var square = Rect(origin: Point(x:0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
let initalSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
square.origin.x
struct Rect2 {
    var origin = Point()
    var size = Size()
    var center:Point {
        get{
            let centerX = origin.x + (size.width/2)
            let centerY = origin.y + (size.height/2)
            return Point(x: centerX, y: centerY)
        }
        set{
            origin.x = newValue.x - (size.width/2)
            origin.y = newValue.y - (size.height/2)
        }
    }
}
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width*height*depth
    }
}

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps){
            print("设置新的totalSteps为\(newTotalSteps)")
        }
        didSet{
            if totalSteps > oldValue {
                print("增加了 \(totalSteps - oldValue)")
            }
        }
    }
}
var step = StepCounter()
step.totalSteps = 2

var test:Int = 0 {
willSet(new){
    print("12")
}
didSet{
    print("old: \(oldValue), new: \(test)")
}
}

test = 3

struct  SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty:Int {
        return 1
    }
}
enum SomeEnum {
    static var storedTypeProperty = "Some value enum"
    static var computedTypeProperty: Int {
        return 2
    }
}
class SomeClass {
    static var storedTypeProperty = "Some value class"
    static var computedTypeProperty: Int {
        return 3
    }
    class var overrideableComputedTypeProperty:Int {
        return 4
    }
}

var test2 = SomeClass()
SomeClass.storedTypeProperty
//test.storedTypeProperty


struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel:Int = 0 {
        didSet{
            if currentLevel > AudioChannel.thresholdLevel {
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}
var leftChannel = AudioChannel()
var rightChannel = AudioChannel()

leftChannel.currentLevel = 5
AudioChannel.maxInputLevelForAllChannels

rightChannel.currentLevel = 12
AudioChannel.maxInputLevelForAllChannels


