struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

class DataImporter{
    var fileName = "data.txt"
}
class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}

let manager = DataManager()
manager.data.append("something")
manager.importer

struct Point {
    var x=0.0,y=0.0
}
struct Size {
    var width=0.0,height=0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point{
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

var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
square.size


class StepCounter {
    var totalSteps: Int = 0{
        willSet(newTotalSteps){
            println("About to set totalSteps to \(newTotalSteps)")
            "About to set totalSteps to \(newTotalSteps)"
        }
        didSet{
            if totalSteps > oldValue {
                println("Added \(totalSteps - oldValue) steps")
                "Added \(totalSteps - oldValue) steps"
            }
        }
    }
}
let stepCounter = StepCounter()
//stepCounter.totalSteps = 200
stepCounter.totalSteps = 360

UInt.max
sizeof(Double)
sizeof(Float)

0b10101

let one = "sdf"
let other = one.toInt()

var surveyAnswer: String?
surveyAnswer








