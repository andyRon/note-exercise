// 协议和扩展

protocol ExampleProtocol{
    var simpleDescription: String{ get }
    mutating func adjust()
        
}
class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
a.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating  func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
b.simpleDescription


extension Int: ExampleProtocol{
    var simpleDescription: String{
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
7.simpleDescription


//泛型

func repeat<ItemType>(item: ItemType, times: Int) -> [ItemType]{
    var result = [ItemType]()
    for i in 0..<times{
        result.append(item)
    }
    return result
}
repeat("knock", 4)

