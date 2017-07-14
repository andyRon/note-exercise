
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func Desc(s1:String, s2:String) -> Bool {
    return s1 > s2
}
names.sort(Desc)

var r = names.sort({(s1:String, s2:String) -> Bool in return s1 > s2})
r = names.sort({s1, s2 in return s1 < s2})
r = names.sort({s1, s2 in s1 < s2})
r = names.sort({$0 > $1})
r = names.sort({$0 < $1})

r = names.sort(){$0 > $1}
r = names.sort{$0 < $1}
r


let digitNames = [
    0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four", 5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [15, 234, 568]
let strings = numbers.map{
    ( var number) -> String in
    var output = ""
    while number > 0 {
        output = digitNames[number % 10]! + output
        number /= 10
    }
    return output
}

strings

var a:String? = ""
a! + "abc"

func makeIncrementor(forIncrement amount:Int) -> ()->Int {
    var runningTotal = 0
    func incrementor() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementor
}

makeIncrementor(forIncrement: 12)()
makeIncrementor(forIncrement: 12)()

let incrementByTen = makeIncrementor(forIncrement: 10)

incrementByTen()
incrementByTen()

let incrementBySeven = makeIncrementor(forIncrement: 7)

incrementBySeven()
incrementBySeven()
incrementByTen()

