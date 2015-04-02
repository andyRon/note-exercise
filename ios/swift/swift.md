### swift 开始
- `println("hello,swift")` 不需要每次都引入单独的库
- 简单值
  + `let` `var`
  + `let explicitDouble:Double = 70`  初始值没有提供足够的信息（或者没有初始值），需要在变量后面声明类型，用冒号分割。
  + 值永远不会被隐式转换为其他类型
  + 用`\()`把值转换成字符串
  
			let apples = 3
			let oranges = 5
			let appleSummary = "I have \(apples) apples."
			let fruitSummary = "I have \(apples + oranges) pieces of fruit."
   + `[]` 定义数组和字典 （php中索引数组和关联数组）
- 控制流

### Swift教程
1. 基础部分
	> 类型安全的语言？  
	
   + 常量和变量  `let`	`var`
   + 类型标注(type annotation)   ： 
   + 常量与变量的命名  Unicode字符 开头有限制
   + 输出常量和变量
       * `println`与`print` 只是最后换不换行的差别。类似Cocoa中得`NSLog`
       * 字符串插值（**string interpolation**） `\()` 可以包含常量、变量、字面量和表达式。 括号中不能包含非转义双引号（"）和反斜杠(\),回车或换行符
   + 注释	可以嵌套注释
   + 分号	在一行写多条独立语句时需要分号，其它情况不是必须的
   + 整数	`UInt8.max`	`Int` `UInt`(无符号类型)
   + 浮点数
   + 类型安全(**type safe**)和类型推断(**type inference**)
   + 数值型字面量
   		* `0b`
   		* `0o`
   		* `0x`
   		* 指数(exponent)
   		* 十六进制浮点数
   + 数值型类型转换
        * 一般Int，只有在必要的时候才使用其他整数类型，比如要处理外部的长度明确的数据或者为了优化性能、内存占用等等。
        * 整数和浮点数的转换必须显示指定类型，而字面量可以直接相加
        
        		let three = 3
				let pointOneFourOneFiveNine = 0.14159
				let pi = Double(three) + 		pointOneFourOneFiveNine
				let a = three + Int(pointOneFourOneFiveNine)
				let aa = 3 + 0.14159
				
   + 类型别名(*type aliases*) `typealias`  
     `typealias AudioSample = UInt16;var maxAmplitudeFound = AudioSample.min`
   + 布尔值
   + 元组(**tuples**): 把多个值组合成一个复合值
   		* 元组内的值可以是任意类型，并不要求是相同类型
   		* 元组适合临时组织值，复杂数据结构使用类和结构体
   		
				let http404Error = (404, "Not Found")
				let (statusCode, statusMessage) = http404Error
				println("The status code is \(statusCode)")
				let (justTheStatusCode, _) = http404Error
				println("\(justTheStatusCode)")
				println(" \(http404Error.0)")
				let http200Status = (statusCode: 200, description: "OK")   
				
	+ 可选类型（optionals）
		* Swift的可选类型可以让你暗示任意类型的值缺失，并不需要一个特殊值
		* int? 可能包含Int值也可能不包含值
		* if语句以及强制解析
		* **nil**	swift中得nil与OjC是不同的
		* 隐式解析可选类型
	+ 断言(assertion) 
		* 断言会结束代码运行并通过调试来找到值缺失的原因
		* `assert()`
		* 何时使用断言：当条件可能为假时使用断言，但是最终一定要保证条件为真，这样你的代码才能继续运行。
- 基本运算符
	+ swift赋值符（=）不返回值
	+ 溢出运算符 &+
	+ 可对浮点数求余	`8%2.5 //0.5`
	+ 复合赋值(compound assignment operators)
	+ 三目运算符(ternary conditional operator)
	+ 空合运算符(Nil Coalescing Operator)
		* `a ?? b`  相当于  `a != nil ? a! : b`
	+ 区间运算符
		* `a...b`
		* `a..<b`
- 字符串和字符
	+ `string`	`NSString`(Foundation)
	+ Unicode标量：`\u{n}`	n为任意的一到八位十六进制数
	+ objectc中字符串是否修改：`NSString` `NSMutableString`
	+ 字符串是值类型（Strings are value types）:字符串在进行常量、变量赋值操作或在函数/方法中传递时，会进行值拷贝。
	+ swift编译器会优化字符串的使用，*使实际的复制只发生在绝对必要的情况下*
	+ `for in` 遍历字符串中得每一个字符
	+ `countElements()` 计算字符数量 全局函数（注意与NSString的length属性的区别）
	+ Swift中字符在一个字符串中并不一定占用相同的内存空间
	+ `hasPrefix()`		`hasSuffix()`
	+ Foundation	`uppercaseString()` `lowercaseString()`
	+ Unicode ??

- 集合类型（Collection Types）

- 函数
	+ Defining and Calling Functions
		- parameters
		- arguments
	+ Function Parameters and Return Values
		- Multiple Input Parameters
		- Functions Without Parameters
		- Functions Without Return Values
			* 返回 `Void`(一个空的元组，`()`)	
		- Functions with Multiple Return Values
			* `func count(string: String)->(vowels:Int,consonants:Int,others:Int){}`
	+ Function Parameter Names
		- External Parameter Names
				
				func join(string s1:String, toString s2:String, withJoiner joiner:String)->String{
					return s1 + joiner + s2
				}
				join(string:"hello",toString:"world",withJoiner:", ")
		- Shorthand External Parameter Names (用`#`表示一个参数名同时作为局部和外部参数名)
				
				func containsCharacter(#string:String, #characterToFind:Character)->Bool{
				}
		- Default Parameter Values
				
				func join(withJoiner joiner:String=" ")->String{ }
		- External Names for Parameters with Default Values
		- 可变参数(Variadic Parameters)
			+ 在变量类型名后面加入(...)	`func arith(numbers:Double...)->Double{ }`
			+ 一个函数至多能有个可变参数，并且必须是参数表中得最后一个
		- Constant and Variable Parameters
		- 输入输出参数(In-Out Parameters) `inout`  `&`
				
				func swapTwoInts(inout a:Int, inout b:Int){
    				let temporaryA = a
    				a = b
    				b = temporaryA
				}
				var someInt = 3
				var anotherInt = 123
				swapTwoInts(&someInt, &anotherInt)
		
	+ Function Types
		- Using Function Types
			+ `var mathFuction: (Int, Int) -> Int = addTwoInts`
			+ `let anotherMathFunction = addTwoInts`(Swift可推断其函数类型)
		- Function Types as Parameter Types
		- Function Type as Return Types
			
				func chooseStepFunction(backwards:Bool)-> (Int)->Int{
					return bacwards?stepBackward:stepForward
				}
	+ 嵌套函数(Nested Funcitons)	


- 闭包(Closures)


- 枚举（Enumerations）	一等类型（first-class）
	+ 枚举语法
		- 类型名以大写开头
		
				enum Planet{
					case Mercury, Venus, Earth, Mars,Jupiter, Saturn, Uranus,Neptune
				}
	+ 匹配枚举值和switch语句
	+ 相关值（Associated values）
	+ 原始值（Raw Values）
   
        