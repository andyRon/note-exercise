
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