
for c in ("Dog!?").characters {
    print(c)
}

let c:Character = "!"

let carray:[Character] = ["d", "o", "g"]

let s = String(carray)

var mut = "dfa"

mut.append(c)

//U+1f425
let u = "\u{1f425}"

"\u{e9}"
"\u{65}"
"\u{65}\u{301}"

"\u{d55c}"

"\u{E9}\u{20DD}"
"\u{1F1FA}\u{1F1F8}"

"\u{1F1FA}\u{1F1F8}".characters.count

"cafe".characters.count
"cafe\u{301}"
"cafe\u{301}".characters.count

//var arr = Array(1..<10).map{return Double($0)}
//
//arr
//
//var arr2 = Array(arrayLiteral: 1.0..<10.0)
//import Foundation
//
//let xs = Array(1..<10).map { return Double($0) }
//let ys1 = xs.map { i in return sin(Double(i / 2.0 / 3.141 * 1.5)) }
//let ys2 = xs.map { i in return cos(Double(i / 2.0 / 3.141)) }
//ys1
//
//sin(1/2.0/3.141 * 1.5)

"\u{e9}" == "\u{65}\u{301}"
"\u{41}"
"\u{410}"
"\u{41}" == "\u{410}"

let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion", "Act 1 Scene 5: The Great Hall in Capulet's mansion", "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

romeoAndJuliet[0].hasPrefix("Act 1")

var test = "\u{65}\u{301}"

for c in test.characters {
    print(c)
}

test.utf8
var dogString = "Dog??"

for codeUint in dogString.utf8 {
    print("\(codeUint)", terminator:" ")
}