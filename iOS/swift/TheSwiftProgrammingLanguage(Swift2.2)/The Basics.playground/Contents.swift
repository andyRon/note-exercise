print(1,3,3, separator:",",terminator:"\r")

/*
 111
 /*
 12312
 */
 */

var u:UInt8 = 17
UInt8.max

var f = 1.23

f.description

0b101

0o13

0x1a

0xc.3p0
//0xc.3

//var int: UInt8 = -1

let int16:Int16 = 2_000
let int8:Int8 = 100

var int_ = int16 + Int16(int8)

3 + 0.1213

let a = 3, b = 0.1213
//a + b

typealias aaxx = UInt16
let aa:aaxx = 1_0000

//if 1 {
//    
//}

let http404error = (404, "Not Found")
//let (statusCode, statusMessage, other) = http404error
let (c, _) = http404error

var cc:Int? = nil
cc = 12
if cc == nil {
    print("yes")
} else {
    print("no")
}
print("adfa\(cc!)")

//if (let ccc = cc) == true {
//    print("yes")
//}


let possibleString:String? = "An optional string"
let forceString:String = possibleString!

let assumeString:String! = "An implicitly unwrapped optional string."
let implicityString:String = assumeString


import Foundation

func canThrowAnErrow() throws { // 这个函数有可能抛出错误
    throw NSError(domain: "adf", code: 2, userInfo: ["key":"abc"])
}

do {
    try canThrowAnErrow() // 没有错误消息抛出
} catch var e {
    // 有一个错误消息抛出
    print(e)
}

//let age = -2
//assert(age >= 0, "A person's age cannot be less than zero")







