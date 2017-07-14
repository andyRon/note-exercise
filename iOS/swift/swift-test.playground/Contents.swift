
var table:String
table = "andyron"

let languageName = "swift"

languageName.isEmpty
languageName.hasPrefix("sw")
languageName.hasSuffix("ft")
languageName.lowercaseString

"ab" + "bc"

var a = 0xa

var str = "戎"

str.unicodeScalars

var str2 = "Dog!🐶"
var tmp = String()
for s in str2.unicodeScalars {
    tmp += " " + "\(s)"
}
print(tmp)
for character in "Dog!🐶".characters {
    print(character)
}
"🐶".unicodeScalars
str2

let catCharacters:[Character] = ["C", "a", "t"]
let catString = String(catCharacters)

var u = "\u{24}"
"\u{1f496}"
"\u{00e9}"


"\u{496}"
"\u{65}\u{301}"
"\u{301}"

"\u{1112}\u{1161}\u{11AB}".characters.count
str2.characters.count
str2
str2.endIndex.predecessor()
str2.startIndex
str2[str2.endIndex.predecessor()]
str2.startIndex.successor()
tmp = ""
for c in str2.characters {
    tmp += "\(c)"
}

var arr:[String] = ["dog", "cat", "pig", "fish", "duck"]

arr += ["egg", "dash"]
arr[3...arr.count-1] = ["a"]
arr
arr.removeAtIndex(1)
arr
arr.removeLast()
str2
for (k, v) in str2.characters.enumerate() {
    print("\(k):\(v)")
}
for (k, v) in



