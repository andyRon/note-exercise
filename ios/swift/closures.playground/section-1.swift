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
