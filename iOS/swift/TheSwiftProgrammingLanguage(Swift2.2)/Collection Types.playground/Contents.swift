//
//var someInts = [Int].self
//
//var otherInts = [Int]()
//
//var threeDoubles = [Double](count:3, repeatedValue: 0.1)
//
//var shoppingList:[String] = ["eggs", "milk"]
//
////var test = [1, "abc"]
//
//shoppingList.count
//shoppingList.isEmpty
//shoppingList.append("Flour")
//shoppingList += ["fish"]
//shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
//
//shoppingList[1...3] = ["milk2", "flour2", "fish2"]
//
//shoppingList.count
////shoppingList[7] = "duck"
////shoppingList.insert("duck")
//shoppingList.insert("duck", atIndex: 7)
//
//shoppingList.removeAtIndex(0)
//
//shoppingList.insert("apple", atIndex: 7)
//
//shoppingList.removeLast()
//
//for (i, v) in shoppingList.enumerate() {
//    
//}
//
//var a = "aaa"
//
//a.hashValue
//var b = "aaa"
//b.hashValue

//Hashable
//var arr = Array<String>()
//
//var letter = Set<String>()
//letter.count
//
//letter.insert("a")
//letter = [];
//letter.insert("c")
//
var m:Set = ["abc", "b", "f"]
var n:Set = ["cds", "v", "ac", "f", "h", "b", "e"]

//m.remove("b")
m.contains("abc")



n.sort()
m.intersect(n)
m.exclusiveOr(n)
m.union(n)
m.subtract(n)
n.subtract(m)



var a:Set = [1, 2, 3, 4, 5, 6, 7, 8]
var b:Set = [3,5]
var c:Set = [7,8, 10, 11, 14]
a == b
b.isSubsetOf(a)
a.isSupersetOf(b)
a.isSubsetOf(a)
a.isStrictSubsetOf(a)

b.isDisjointWith(c)

var dic = [Int:String]()
var dic2 = [String:String]()
 dic2 = [:]

var airports = ["YYZ":"Toronto Pearson", "DUB": "Dublin"]
var dic3 = ["a":95, "b":96]

airports["LHR"] = "London"
airports.updateValue("Shanghai", forKey: "SH")
airports.updateValue("shanghai", forKey: "SH")

let dictest = airports.removeValueForKey("SH")
var dddd:String?;
dddd = airports.removeValueForKey("DFDF");

if let removedValue = airports.removeValueForKey("DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary does not contain a value for DUB.")
}
// prints "The removed airport's name is Dublin Airport."

airports.keys   // 返回时数组还是字典？


