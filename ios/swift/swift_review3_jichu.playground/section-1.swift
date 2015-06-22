//swift教程
//基础部分


let minValue = UInt8.min

var intt = 1


let zhi = 0xFp2
let zhi2 = 0xfp-2
let zhi3 = 0xc.3p0

2e2
3.5e2
0x2e2   //??
0x2p2
0x12

0b10001
0o21

1_000_000
100000
0002
//0xC.3  //十六进制浮点字面量必须以指数结束
0xC.3p0


//let cannotBeNegative: UInt8 = -1
let cannotBeNegative: UInt8 = UInt8.max

let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi = Double(three) + pointOneFourOneFiveNine
let a = three + Int(pointOneFourOneFiveNine)
let aa = 3 + 0.14159


typealias AudioSample = UInt16
AudioSample.max

//BooleanType

//let i = 1
//if i {
//}

let http404Error = (404, "Not Found")
let (statusCode, statusMessage) = http404Error
println("The status code is \(statusCode)")
let (justTheStatusCode, _) = http404Error
println("\(justTheStatusCode)")
println(" \(http404Error.0)")
let http200Status = (statusCode: 200, description: "OK")

let possibleString: String? = "An optional string."
println(possibleString!)

let age = -3
//assert(age >= 0,"A person's age cannot be less than zero")
if a == 2{
}

8%2.5
 2 &+ 3
//var d: Int = 12312312321312312312
//d &+ 23
 
"\u{24}"

"\u{2322}"

var emptystring = String()
emptystring.isEmpty
let letstring = "dfasfsaf"
for  we in letstring{
    println(we)
}

let solostring: Character = "s"
var test = "1d我"
//countElements(test)
test.append(solostring)
//test.append("s")

test.hasPrefix("1d")

import Foundation
letstring.uppercaseString

"\u{0061}"
"\u{1f425}"

letstring.unicodeScalars

let dogString = "Dog!"
for codeUnit in dogString.utf8{
    println("\(codeUnit)")
}











 



