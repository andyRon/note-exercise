func swapTwoInts(inout a: Int, inout _ b: Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 23
var otherInt  =  45
swapTwoInts(&otherInt, &someInt)
someInt

func swapTwoValues<T>(inout a: T, inout b: T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

struct IntStack {
    var items = [Int]()
    mutating func push(item:Int){
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
}
struct Test{
    
}
var t = Test()
struct Stack<T> {
    var items = [T]()
    mutating func push(item:T){
        items.append(item)
    }
    mutating func pop() -> T {
        return items.removeLast()
    }
}

var s = Stack<String>()
s.push("a")
s.push("b")
s.pop()

extension Stack {
    var topItem:T?{
        return items.isEmpty ? nil : items[items.count - 1]
    }
}