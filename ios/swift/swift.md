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
	
   + 常量和变量  `let`	`var`， 只将需要改变的值设为变量
   + 类型标注(type annotation)   `:` 
   + 常量与变量的命名  Unicode字符 开头有限制
   + 输出常量和变量
       * `println`与`print` 只是最后换不换行的差别。类似Cocoa中得`NSLog`
       * 字符串插值（**string interpolation**） `\()` 可以包含常量、变量、字面量和表达式。 括号中不能包含非转义双引号（"）和反斜杠(\),回车或换行符
   + 注释	可以嵌套注释
   + 分号	在一行写多条独立语句时需要分号，其它情况不是必须的
   + 整数	`UInt8.max`	`Int` `UInt`(无符号类型)
   		* `Int`的长度与当前平台的原生字长度相同
   		* 避免类型的数字之间的转换   		
   + 浮点数 `Double` `Float` (swift推测类型时默认先是`Double`)
   + 类型安全(**type safe**)和类型推断(**type inference**)
   + 数值型字面量
   		* `0b`
   		* `0o`
   		* `0x`
   		* 指数(exponent)  `1.23e4`  `0xfp4` 
   		* 十六进制浮点数
   		* `2_000_000`(只是增加可读性)
   + 数值型类型转换
        * 一般Int，只有在必要的时候才使用其他整数类型，比如要处理外部的长度明确的数据或者为了优化性能、内存占用等等。
        * 整数和浮点数的转换必须显示指定类型，而字面量可以直接相加
        
        		let three = 3
				let pointOneFourOneFiveNine = 0.14159
				let pi = Double(three) + 		pointOneFourOneFiveNine
				let a = three + Int(pointOneFourOneFiveNine)
				let aa = 3 + 0.14159
				
   + 类型别名(*type aliases*) `typealias`  
     `typealias AudioSample = UInt16;`  
     `var maxAmplitudeFound = AudioSample.min`
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
		* **可选绑定** if while
		* **nil**	
		如果代码中又常量或变量需要处理缺失的情况，声明为对于的可选类型 `let some:Int? = 404`  
		swift中得nil与OjC是不同的
		* **隐式解析可选类型**
	+ 断言(assertion) 
		* 断言会结束代码运行并通过调试来找到值缺失的原因
		* `assert()`
		* 何时使用断言：当条件可能为假时使用断言，但是最终一定要保证条件为真，这样你的代码才能继续运行。
2. 基本运算符
	+ swift赋值符（=）不返回值
	+ **溢出运算符** &+
	+ 可对浮点数求余	`8%2.5 //0.5`
	+ 自增和自减	整形和浮点
	+ 复合赋值(compound assignment operators) `+=`
	+ 比较运算符 `==` `!=` `>=` `<=` `>` `<`  
	  恒等和不恒等用来判断两个对象是否引用同一个对象实例
	  
	+ 三目运算符(ternary conditional operator)
	+ 空合运算符(Nil Coalescing Operator)
		* `a ?? b`  相当于  `a != nil ? a! : b`（a必需是可选类型）
	+ 区间运算符
		* `a...b`
		* `a..<b`
	+ 逻辑运算符
	
3. 字符串和字符
	+ `String`	`NSString`(Foundation)
	+ `Character` 字符类型只能有一个字符 `"a"`
	+ Unicode标量：`\u{n}`	n为任意的一到八位十六进制数
	+ objectc中字符串是否修改：`NSString` `NSMutableString`
	+ 字符串是**值类型**（Strings are value types）:字符串在进行常量、变量赋值操作或在函数/方法中传递时，会进行值拷贝。
	+ swift编译器会优化字符串的使用，*使实际的复制只发生在绝对必要的情况下*
	+ `for in` 遍历字符串中得每一个字符
	+ `countElements()` 计算字符数量 全局函数（注意与NSString的length属性的区别）
	+ `countElements()` & `count()` ??
	+ Swift中字符在一个字符串中并不一定占用相同的内存空间
	+ `.hasPrefix()`		`.hasSuffix()`
	+ Foundation	`.uppercaseString()` `.lowercaseString()`
	+ Unicode ??
	+ `.unicodeScalars` 得到unicode的十进制数
	
			let aa = "我们"
			tmp = ""
			for uc in aa.unicodeScalars{
   	 			tmp += " \(uc.value)"
			}
			tmp
			// " 25105 20204"
			
			
4. 集合类型（Collection Types）
	+ 数组
		- 存入数组之前的数据类型必需明确
		- 一个数组中只能有一种数据类型
		- `var shoppinglist:[String] = ["eggs", "Milk"]`
		- `.append()` `shoppinglist += ["apple", "Butter"]`
		- `shopplist[3...shopplist.count-1] = ["b", "c"]` (把数组从3位开始到最后的所有元素替换为"b", "c")
		- 不能使用下标在数组尾巴添加新项
		- 数组的最大索引一直都是count-1
		- `shopplist.insert("asdf", atIndex:1)` (在1项前加元素“asdf”)
		- `.removeAtIndex()` 移除某一项
		- `.removeLast()`
		- 数组的遍历
			* `for item in []`
			* 全局函数`enumerate()` 返回每个数组项的索引值和数据值组成的元组   
			`for (index, value) in enumerate(shopplist) { }`
		- 创建一个数组  
		 `var  someint = [Int]()`  
		 `var threee = [Double](count: 3, repeatedValue: 3.3)`
	+ 字典
		- 与数组区别*数据项没有具体顺序*
		- `var airports:[String:String] = ["TYO":"Tokyo", "DUB":"Dublin"]`
		- .count .isEmpty
		- 字典可以通过下标添加新项 `airports["hongqiao"] = "shanghai"`
		- `airports.updateValue("nanjing", forKey: "jichang")` 更新或设置
 		- `airports["jichang"] = nil`	 "jichang"被移除 或 `.removerValueForKey()`
 		- 字典遍历
 			* `for (code, name) in airports{}`
 			* `for code in airports.keys{}`
 		- 字典顺序是不固定的，遍历时会重新排序
 		- 创建字典
 			* `var namesIntegers = Dictionary<Int,String>()`
			* 在已经知道字典信息类型后可以  `namesIntegers = [:]`
	+ 集合的可变性
		- 不可变数组


5. 控制流
	- 循环语句 For-in	区间(range),序列(sequence),集合(collection),系列(progression)
		+ `for index in 1...5{}` (index是常量)
		+ `for _ in 1...5{}`
		+ `for v in array{}`
		+ `for (k, v) in dic{}`
		+ `for character in "hello"{}`
	- 循环语句 For
	- 循环语句 While do-while
	- 条件语句 if  
	- 条件语句 switch 适合条件复杂
		+ 不存在隐式的贯穿（不需要break）
		+ 每个case分支都必需包含至少一条语句
		+ 一个case可以包含多个模式，用`,`隔开
		+ 可匹配区间 `case 1...4`
		+ 元组
		
				let somepoint = (1,1)
				switch somepoint{
				case (0,0):
					//
				case (_,0):
					//
				case (0,_):
					//
				case (-2...2, -2...2):
					//
				default:
					//
				}
		+ swift允许多个case匹配同一个值，只会执行第一个被匹配的
		+ **值绑定(Value Bindings)**
		+ 使用`where`
		
				let sompoint = (1,-1)
				switch sompoint {
				case let(x,y) where x == y:
    				println();		
				case let(x,y) where x == -y:
    				println();
				case let(x,y):
    				println()
				}
	- 控制转移语句
		+ `continue`

		
		
6. 函数
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

- 类和结构体

- 属性
	+ Stored Properties
	+ 常量结构体的存储属性
	+ 延迟存储属性  `lazy var`
		* 必须将延迟存储属性声明成变量（使用var关键字），因为属性的初始值可能在实例构造完成之后才会得到。而常量属性在构造过程完成之前必须要有初始值，因此无法声明成延迟属性。
		* 如果一个被标记为lazy的属性在没有初始化时就同时被多个线程访问，则无法保证该属性只会被初始
	+ 计算属性  getter (setter, `newValue`)
		* 只读计算属性
		* 必须使用var关键字定义计算属性
	+ 属性观察器(property observer)
		* 可以添加的： 
			- 存储属性（除了延迟存储属性）
			- **重写的计算属性**
		* 每次属性被设置值的时候都会调用属性观察器
		* willSet (newValue)
		* didset (oldValue)
	+ 全局变量和局部变量   
	全局的常量或变量都是延迟计算的（不需要`lazy`），局部范围的常量或变量不会延迟计算。
	+ 类型属性（类似于静态属性）
	
- 方法 

	
- 下标脚本(subscripts)

- 继承(inheritance) 
	+ base class
	+ subclassing
	+ overriding
		* overriding: 子类可以为继承来的实例方法（instance method），类方法（class method），实例属性（instance property），或下标脚本（subscript）提供自己定制的实现（implementation）。
		* 访问超类的方法，属性及下标脚本
		* 重写方法
		* 重写属性
		* 重写属性的Getters和Setters
		* 重写属性观察器（Property Observer）
	+ 防止重写 `final`   final var, final func, final class func, 以及 final subscript	 
- initialization(构造过程)
	+ initializer  `init() {}` 不需要返回值	
	+ 存储属性的初始赋值	  
		类和结构体在创建实例时，必须为所有存储型属性设置合适的初始值。(构造器或定义时时直接设置)
	+ 自定义构造过程
		- 构造参数  
		不同参数调用不同构造器  

			struct Celsius {
			    var temperatureInCelsius: Double
			    init(fromFahrenheit fahrenheit: Double) {
			        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
			    }
			    init(fromKelvin kelvin: Double) {
			        temperatureInCelsius = kelvin - 273.15
			    }
			}
			let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
			// boilingPointOfWater.temperatureInCelsius 是 100.0
			let freezingPointOfWater = Celsius(fromKelvin: 273.15)
			// freezingPointOfWater.temperatureInCelsius 是 0.0”
		- 参数的内部名称和外部名称  
			定义构造器时没有提供参数的外部名字，Swift 会为每个构造器的参数自动生成一个跟内部名字相同的外部名。
		- 不带外部名的构造器参数  
			`init(_ celsius: Double)`    => 	`Celsius(37.0)`
		- 可选属性类型
		
		
		


-----------------
值类型	类类型	引用类型 
逆向建模
	
   
        