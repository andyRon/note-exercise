//8%3.4
//
//"\u{0061}"
//"\u{2664}"
//"\u{0021}"
//"\u{2c77}"
//"\u{5B57}"
//"\u{4E00}"
//"\u{4e01}"
//0x9fbf - 0x4e00
//"\u{0100}"
//
//var a = "阿达法萨芬的"
//a.isEmpty
//"\u{24}"
//"\u{1F436}"
//count(a)
//println("sadfa \(count(a)) adfsaf")
////countElements(1231)
//"adfasf".hasSuffix("f")
//
//let dogstring = "dog!"
//var tmp = ""
//dogstring.utf8
//let dogface = "\u{1f436}"
//for uc in dogstring.utf8{
//    tmp += " \(uc)"
//}
//tmp
//tmp = ""
//for uc in dogface.utf8{
//    tmp += " \(uc)"
//}
//tmp
//let aa = "我们"
//tmp = ""
//for uc in aa.unicodeScalars{
//    tmp += " \(uc.value)"
//}
//tmp
//"\u{6211}"
//
////12p2
//0x12p2
//
//let twothousand:UInt16 = 2_000
//twothousand
//let http400eorror = (400, "Not Found")
//http400eorror.0
//let (code, msg) = http400eorror
//code
//msg
//msg.toInt() //int?
////if asdfs != nil{
////    let yes = "fasdf"
////}else{
////    let no = "sdf"
////}
//
//
//let (f,g) = (3,"d")
//let cat:Character = "c"
//let dog:String = "d"


var shopplist = ["eggs", "milk"]
shopplist += ["apple", "a","flour", "wo"]
shopplist.count

shopplist[3...shopplist.count-1] = ["b", "c"]
//shopplist[5] = "afd"
//shopplist[5]
shopplist.insert("asdf", atIndex:1)

for (index, value) in enumerate(shopplist) {
    println("\(index+1): \(value)")
}
enumerate(shopplist)
var  someint = [Int]()
someint = []
var threee = [Double](count: 3, repeatedValue: 3.3)














