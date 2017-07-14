class Counter {
    var count = 0
    func increment(){
        count += 1
    }
    func incrementBy(amount: Int){
        count += amount
    }
    func reset(){
        count = 0
    }
}

let counter = Counter()
counter.increment()
counter.count

counter.incrementBy(2)
counter.count
counter.reset()

class Counter2 {
    var count = 0
    func increment(){
        count += 1
    }
    func incrementBy(amount: Int, numberOfTimes:Int){
        count += amount*numberOfTimes
    }
    func reset(){
        count = 0
    }
}

struct  Point {
    var x = 0.0
    var y = 0.0
    func isToTheRightOfx(x: Double) -> Bool{
        return self.x > x
    }
}

struct  Point2 {
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX: Double, deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
var somePoint = Point2(x: 1.3, y: 2.3)
somePoint.moveByX(3.2, deltaY: 1)
struct  Point3 {
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX: Double, deltaY: Double) {
        self = Point3(x: x+deltaX, y: y+deltaY)
    }
}

enum TriStateSwitch {
    case Off, Low, High
    mutating func next() {
        switch self {
        case Off:
            self = Low
        case Low:
            self = High
        case .High:
            self = Off

        }
    }
}

class SomeClass {
    class func someTypeMethod(){
        
    }
}
SomeClass.someTypeMethod()
var someClass = SomeClass()
//someClass.someTypeMethod()

struct  LevelTracker {
    static var highestUnlockedLevel = 1
    static func unlockLevel(level: Int) {
        highestUnlockedLevel = level
    }
    static func levellsUnlocked(level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    var currentLevel = 1
    mutating func advanceToLevel(level: Int) -> Bool {
        if LevelTracker.levellsUnlocked(level) {
            currentLevel = level
            return true
        }else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    func completedLevel(level:Int){
        LevelTracker.unlockLevel(level+1)
        tracker.advanceToLevel(level+1)
    }
    init(name: String){
        playerName = name
    }
}