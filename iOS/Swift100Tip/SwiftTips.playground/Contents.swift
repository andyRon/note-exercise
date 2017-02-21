// Sequence
// 先定义一个实现了 GeneratorType protocol 的类型
// GeneratorType 需要指定一个 typealias Element 
// 以及提供一个返回 Element? 的方法 next()
class ReverseGenerator: IteratorProtocol {
    typealias Element = Int
    var counter: Element
    init<T>(array: [T]) {
        self.counter = array.count - 1
    }
    init(start: Int) {
        self.counter = start
    }
    func next() -> Element? {
        if (self.counter < 0 ) {
            return nil
        } else {
            counter -= 1
            return counter
        }
    }
}

// 多元组 (Tuple)
func swapMe<T>( a: inout T, b: inout T) { let temp = a
    a=b
    b = temp
}
func swapMe2<T>( a: inout T, b: inout T) {
    (a,b) = (b,a)
}
// 直接返回一个带有 NSError 的多元组，而不是去填充地址了
/**
func doSomethingMightCauseError() -> (Bool, Error?) { 
    //... 做某些操作，成功结果放在 success 中
    if success {
        return (true, nil)
    } else {
        return (false, Error(domain:"SomeErrorDomain", code:1, userInfo: nil))
    }
}
let (success, maybeError) = doSomethingMightCauseError()
if let error = maybeError {
// 发生了错误 
}
 */

// 操作符
struct Vector2D {
    var x = 0.0
    var y = 0.0
}
let v1 = Vector2D(x: 2.0, y: 3.0)
let v2 = Vector2D(x: 1.0, y: 4.0)
let v3 = Vector2D(x: v1.x + v2.x, y: v1.y + v2.y)
func +(left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x, y: left.y + right.y)
}
let v4 = v1 + v2    // + 号操作符 被重新定义
print(v4)
1 + 2
infix operator +* {     // 声明+*为操作符
associativity none
precedence 160 // 运算的优先级，越高的话越优先进行运算。Swift 中乘法和除法的优先级是 150， 加法和减法是 140，这里我们定义点积优先级 160，就是说应该早于普通的乘除进 行运算。
}
func +* (left: Vector2D, right: Vector2D) -> Double {
    return left.x * right.x + left.y * right.y
}
let result = v1 +* v2

// swift3 方法参数名称都不可以省略了
class Car {
    init(color: Int, weight: Int) {
    }
}
let car = Car(color: 1, weight: 2)

extension Car {
    func moveTox(x: Int, y: Int) {
        
    }
}
car.moveTox(x: 2, y: 1)



// 实例方法的动态调用
class MyClass {
    func method(number: Int) -> Int {
        return number + 1
    }
}
let f = MyClass.method
let object = MyClass()
let result1 = f(object)(1)

//arc4random()

import Foundation
let string = "/var/controller_driver/secret_photo.png" as NSString
let components = string.pathComponents


