//{ (parameters) -> returnType in
//    statements
//}



let names = ["Chris","Andy","Alex","Paul","Barry"]

func backwards(s1:String,s2:String)->Bool{
    return s1 > s2
}
var reversed = sorted(names,backwards)

names

reversed = sorted(names,{(s1:String,s2:String)->Bool in return s1>s2})

// 在内联闭包表达式中，函数和返回值类型都写在大括号内，而不是大括号外。
//省略形式
reversed = sorted(names,{s1,s2 in return s1>s2})
//实际上任何情况下，通过内联闭包表达式构造的闭包作为参数传递给函数时，都可以推断出闭包的参数和返回值类型，这意味着您几乎不需要利用完整格式构造任何内联闭包。
//单行表达式闭包可以省略 return
reversed = sorted(names,{s1,s2 in s1>s2})
reversed = sorted(names,{$0>$1})
// Operator Functions
reversed = sorted(names,>)
//Trailing Closures
reversed = sorted(names){$0>$1}

let digitNames = [ 0:"Zero",1:"One",2:"Two",3:"Three",4:"Four",5:"Five",6:"Six",7:"Seven",8:"Eight",9:"Nine"]
let numbers = [16,58,510]

let strings = numbers.map(){
    (var number)->String in
    var output = ""
    while number > 0{
        output = digitNames[number % 10]! + output
        number /= 10
    }
    return output
}
// 变量参数 常量参数
// 叹号可以用于强制解析（force-unwrap）存储在可选下标项中得String类型值


// 捕获值（captuing values）
func makeIncrementor(forIncrement amount:Int)-> () ->Int{
    var runningTotal = 0
    func incrementor()->Int{
        runningTotal += amount
        return runningTotal
    }
    return incrementor
}

let incrementByTen = makeIncrementor(forIncrement: 10)
incrementByTen()
incrementByTen()
let incrementByFive = makeIncrementor(forIncrement: 5)
incrementByFive()
incrementByTen()
// 如果您将闭包赋值给一个类实例的属性，并且该闭包通过指向该实例或其成员来捕获了该实例，您将创建一个在闭包和实例间的强引用环。 Swift 使用捕获列表来打破这种强引用环。

// 函数和闭包都是引用类型

