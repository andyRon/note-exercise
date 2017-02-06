## swift 开始
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


## Swift教程
### 1. 基础部分
	> 类型安全的语言？  
	
   + 常量和变量  `let`	`var`， 只将需要改变的值设为变量
   + 类型标注(type annotation)   `:` 
   + 常量与变量的命名  Unicode字符 开头有限制
   		* 常量与变量名不能包含数学符号,箭头,保留的(或者非法的)Unicode 码位,连线与制表符
   		* 一旦你将常量或者变量声明为确定的类型,你就不能使用相同的名字再次进行声明,或者改变其存储的值的类型。同时,你也不能将常量与变量进行互转
   		* 反引号包围来使用保留关键字		 
   + 输出常量和变量
       * `println`与`print` 只是最后换不换行的差别。类似Cocoa中得`NSLog`
       * `print(_:separator:terminator:) `  完整第一形式：`public func print(_ items: Any..., separator: String = default, terminator: String = default)`  
         有三个字段items：一个或多个打印项
       * 字符串插值（**string interpolation**） `\()` 可以包含常量、变量、字面量和表达式。 括号中不能包含非转义双引号（"）和反斜杠(\\),回车或换行符
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
   		* 指数(exponent)  十进制:`1.23e4`, 十六进制:`0xfp4` 
   		* 十六进制浮点数
   		* `2_000_000`(只是增加可读性)
   		* `let hexadecimalDouble = 0xC.3p0 // 12+(3/16)` p0不能去掉，十六进制的浮点数必须带指数
   + 数值型类型转换
        * 一般Int，只有在必要的时候才使用其他整数类型，比如要处理外部的长度明确的数据或者为了优化性能、内存占用等等。
        * 整数和浮点数的转换必须显示指定类型，而字面量可以直接相加(`3 + 0.14159`, 因为数字字面量本身没有明确的类型。它们的类型只在编译器需要求值的时候被推测。)
        
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
			- 使用 if 语句和 nil 比较来判断一个可选值是否包含值
			- `!`
		* **可选绑定** if while
			
				if let actualNumber = Int(possibleNumber) {
				} else {
				}

				- *如果 返回的可选   包含一个值,创建一个叫做   的新常量并将可选包含 的值赋给它。*
		* **nil**	
		如果代码中又常量或变量需要处理缺失的情况，声明为对于的可选类型 `let some:Int? = 404`  
		swift中得nil与OjC是不同的
		* **隐式解析可选类型**
	+ 错误处理???
	+ 断言(assertion) 
		* 断言会结束代码运行并通过调试来找到值缺失的原因
		* `assert()`
		* 何时使用断言：当条件可能为假时使用断言，但是最终一定要保证条件为真，这样你的代码才能继续运行。
	
### 2. 基本运算符
	+ swift赋值符（=）不返回值
	+ **溢出运算符** &+	**Swift 默认情况下不允许在数值运算中出现溢出情况**
	+ 可对浮点数求余	`8%2.5 //0.5`   
		**a = (b × 倍数) + 余数** (倍数是整数，可以使负数)
	+ 自增和自减	整形和浮点
	+ 复合赋值(compound assignment operators) `+=`
	+ 比较运算符 `==` `!=` `>=` `<=` `>` `<`  
	  恒等和不恒等用来判断两个对象是否引用同一个对象实例
	  
	+ 三目运算符(ternary conditional operator)
	+ 空合运算符(Nil Coalescing Operator)
		* `a ?? b`  相当于  `a != nil ? a! : b`（a必需是可选类型）(?? 前后要空格)
	+ 区间运算符
		* `a...b`
		* `a..<b`
	+ 逻辑运算符

	
## 3. 字符串和字符
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
	+ Unicode 
		* Unicode 标量(Unicode Scalars)
		* 字符串字面量的特殊字符 (Special Characters in String Literals)
		* 可扩展的字形群集(Extended Grapheme Clusters)
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
		+ switch语句必须穷举所有情况
	- 控制转移语句
		+ `continue`

		
		
6. 函数
	+ 函数类型	参数值类型 返回值类型
	+ 函数定义与调用(Defining and Calling Functions)
		- 参数 parameters
		- 实参 arguments
		- 函数定义：函数做什么,它期望接收什么和执行结束时它返回的结果是什么
		- 
	+ 函数参数与返回值(Function Parameters and Return Values)
		- 多重输入参数(Multiple Input Parameters)
		- 多参量函数(Functions With Multiple Parameters)  区别是不同的类型的参数？？  
			**当调用超过一个参数的函数时,第一个参数后的参数根据其对应的参数名称标记**
		- 无参函数(Functions Without Parameters)
		- 无返回值函数(Functions Without Return Values)
			* 返回 `Void`(一个空的元组，`()`)	
		- 多重返回值函数(Functions with Multiple Return Values)
			* `func count(string: String)->(vowels:Int,consonants:Int,others:Int){}`
			* **元组的成员不需要在函数中返回时命名,因为它们的名字已经在函数返回类型中有了定义**
			* **注意: 可选元组类型如 (Int,Int)? 与元组包含可选属性如 (Int?,Int?) 是不同的.**
	+ 函数参数名称(Function Parameter Names)
		- **外部参数名**(External Parameter Names)
		- **本地参数名**(local parameter name)  
			*外部参数名用来标记传递给函数调用的参数,本地参数名在实现函数的时候使用.*  
			*一般情况下,第一个参数省略其外部参数名,第二个以后的参数使用其本地参数名作为自己的外部参数名.所有参数 需要有不同的本地参数名,但可以共享相同的外部参数名*  
			*如果你提供了外部参数名,那么函数在被调用时,必须使用外部参数名。*  
			*使用外部参数名可以使得函数可以用一句话表达清楚,并且使得函数体内部可读,能表达出函数的明确意图.*  
			*如果你不想为第二个及后续的参数设置参数名,用一个下划线(_)代替一个明确地参数名.*
				
				func join(string s1:String, toString s2:String, withJoiner joiner:String)->String{
					return s1 + joiner + s2
				}
				join(string:"hello",toString:"world",withJoiner:", ")
		<!-- - Shorthand External Parameter Names (用`#`表示一个参数名同时作为局部和外部参数名)
				
				func containsCharacter(#string:String, #characterToFind:Character)->Bool{
				} -->
		- 默认参数值(Default Parameter Values)
				
				func join(withJoiner joiner:String=" ")->String{ }
		- External Names for Parameters with Default Values
		- 可变参数(Variadic Parameters)
			+ 在变量类型名后面加入(...)	`func arith(numbers:Double...)->Double{ }`
			+ 传入可变参数的值在函数体内当做这个类型的一个数组
			+ 一个函数至多能有一个可变参数，并且必须是参数表中得最后一个
		- 常量参数和变量参数(Constant and Variable Parameters)
			+ 函数参数默认是常量。试图在函数体中更改参数值将会导致编译错误。
		- 输入输出参数(In-Out Parameters) `inout`  `&`
				
				func swapTwoInts(inout a:Int, inout b:Int){
    				let temporaryA = a
    				a = b
    				b = temporaryA
				}
				var someInt = 3
				var anotherInt = 123
				swapTwoInts(&someInt, &anotherInt)

			+ 想要一个函数可以修改参数的值,并且想要在这些 修改在函数调用结束后仍然存在
			+ 传入的参数作为输入输出参数时,需要在参数前加 & 符
			+ *输入输出参数是函数对函数体外产生影响的另一种方式。*
		
	+ 函数类型(Function Types)
		- Using Function Types
			+ `var mathFuction: (Int, Int) -> Int = addTwoInts`
			+ `let anotherMathFunction = addTwoInts`(Swift可推断其函数类型)
		- 函数类型作为参数类型(Function Types as Parameter Types)
		- 函数类型作为返回类型(Function Type as Return Types)
			
				func chooseStepFunction(backwards:Bool)-> (Int)->Int{
					return bacwards?stepBackward:stepForward
				}
	+ 嵌套函数(Nested Funcitons)	
		- 一个封闭函数也可以返回它的某一个嵌套函数,使得这个函数可以在其他域中被使用。


- 闭包(Closures)


- 枚举（Enumerations）	一等类型（first-class）
	+ 枚举语法
		- 类型名以大写开头
		- 给枚举类型起一个单数名字而不是复数名字，以便于读起来更加容易理解
		
				enum Planet{
					case Mercury, Venus, Earth, Mars,Jupiter, Saturn, Uranus,Neptune
				}
	+ 一旦被声明为枚举类型，就可以用简短的点语法
	+ 匹配枚举值和switch语句
	+ 相关值（Associated values）
	+ 原始值（Raw Values）
		* 原始值和关联值是不同的。原始值是在定义枚举时被预先填充的值，像上述三个 ASCII 码。对于一个特定的枚 举成员，它的原始值始终不变。关联值是创建一个基于枚举成员的常量或变量时才设置的值，枚举成员的关联值 可以变化。
		* 使用原始值初始化枚举实例(Initializing from a Raw Value)
	+ 递归枚举(Recursive Enumerations)
		* `indirect`

	```
	/**
	“定义一个名为 Barcode 的枚举类型，它的一个成员值是具有 (Int，Int，Int，Int) 类型关联值的 UPCA ，另一 个成员值是具有 String 类型关联值的 QRCode 。”
	*/
	enum Barcode {
	     case UPCA(Int, Int, Int, Int)
	     case QRCode(String)
	}
	

	var productBarcode = Barcode.UPCA(8, 85909, 51226, 3)
	productBarcode = .QRCode("ABCDEFGHIJKLMNOP")
	switch productBarcode {
	 case .UPCA(let numberSystem, let manufacturer, let product, let check):
	     print("UPC-A: \(numberSystem), \(manufacturer), \(product), \(check).")
	 case .QRCode(let productCode):
	     print("QR code: \(productCode).")
	 }
	```

- 类和结构体(Classes and Structures)
	+ 共同处
		* 定义属性用于存储值
 		* 定义方法用于提供功能
		* 定义下标操作使得可以通过下标语法来访问实例所包含的值 
		* 定义构造器用于生成初始化值
		* 通过扩展以增加默认实现的功能 
		* 实现协议以提供某种标准功能
	+ 类相对于结构体的附加功能
		* 继承允许一个类继承另一个类的特征
		* 类型转换允许在运行时检查和解释一个类实例的类型 
		* 析构器允许一个类实例释放任何其所被分配的资源
		* 引用计数允许对一个类的多次引用（**结构体总是通过被复制的方式在代码中传递，不使用引用计数。**）
	+ 类名和结构名用**UpperCamelCase**, 属性和方法名用**lowerCameCase**
	+ 类和结构体实例
	+ 属性访问
	+ 结构体类型的成员逐一构造器(Memberwise Initializers for Structure Types)
		* `let vga = Resolution(width:640, height: 480)`
	+ 结构体和枚举是值类型
		* 在 Swift 中，所有的基本类型:整数(Integer)、浮 点数(floating-point)、布尔值(Boolean)、字符串(string)、数组(array)和字典(dictionary)，都是 值类型，并且在底层都是以结构体的形式所实现。
	+ 类是引用类型
		* 对象变量被设置成常量是，其的属性是可以变化的。因为对象变量时类实例的一个引用，属性给变这个引用并没有变化
		* 恒等运算符（用于引用类型判断两个变量或常量是否引用同一个类实例）
		* 指针
	+ 类和结构体的选择
		* 选用结构体
			- 该数据结构的主要目的是用来封装少量相关简单数据值。
			- 有理由预计该数据结构的实例在被赋值或传递时，封装的数据将会被拷贝而不是被引用。 - 该数据结构中储存的值类型属性，也应该被拷贝，而不是被引用。
			- 该数据结构不需要去继承另一个既有类型的属性或者行为。
	+ **Objective-C 中 NSString ， NSArray 和 NSDictionary 类型均以类的形式实现，而并非结构体。**

- 属性
	+ 存储属性 Stored Properties （只能用于类和结构体）
		* 常量结构体的存储属性（常量结构的属性不能修改）
		* 延迟存储属性  `lazy var`
			- 必须将延迟存储属性声明成变量（使用var关键字），因为属性的初始值可能在实例构造完成之后才会得到。而**常量属性在构造过程完成之前必须要有初始值**，因此无法声明成延迟属性。
			- 如果一个被标记为lazy的属性在没有初始化时就同时被多个线程访问，则无法保证该属性只会被初始
		* 存储属性和实例变量 ??
	+ 计算属性  getter (setter, `newValue`) （用于类、结构体和枚举）
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
		* 存储型类型属性是延迟初始化的
		* `static` `class`	
		
- 方法 
	+ 结构体和枚举能够定义方法是 Swift 与 C/Objective-C 的主要区别之一
	+ 实例方法 (Instance Methods)
		* 实例方法不能脱离于现存的实例而被调用。
		* 方法的局部参数名称和外部参数名称 (Local and External Parameter Names for Methods)
		* 像在 Objective-C 中一样，Swift 中方法的名称通常用一 个介词指向方法的第一个参数，比如:  with, for, by   等等。介词的使用让方法在被调用时能像一个句子一样被解读。
		* self 属性 
			- self完全等同于该实例本身（可省略）
		* 在实例方法中修改值类型(Modifying Value Types from Within Instance Methods)
			- `mutating`
		* 在可变方法中给 self 赋值(Assigning to self Within a Mutating Method)
	+ 类型方法 (Type Methods)
		* `static`  `class`
		* 在类型方法的方法体(body)中， `self`指向这个类型本身，而不是类型的某个实例。
		* 在类型方法的方法体中，任何未限定的方法和属性名称，可以被本类中其他的类型方法和类型属性引
用。（可以省略self或类型名称）

	
- 下标脚本(subscripts)
	+ 下标 (subscripts)可以定义在类(class)、结构体(structure)和枚举(enumeration)中，是访问集合(c ollection)，列表(list)或序列(sequence)中元素的快捷方式。
	+ 下标语法
	+ 下标选项
		* 下标可以接受任意数量的入参，并且这些入参可以是任意类型。下标的返回值也可以是任意类型。下标可以使用
变量参数和可变参数，但不能使用输入输出参数，也不能给参数设置默认值。
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






		
- Protocols
	+ 属性的语法  
	
			protocol SomeProtocol {
				var mustBeSettable : Int { get set }
				var doesNotNeedToBeSettable: Int { get }
			}

- Generics

### 访问控制
> 给单个类型(类、结构体、枚举)设置访问级别,也可以给这些类型的属性、函数、初始化方
法、基本类型、下标索引等设置访问级别  
**单目标应用程序**  
- 模块和源文件 	
- 访问级别
	+ `public`
	+ `internal`(默认)
	+ `private`
	+ 一个*类*可以访问定义该*类*的源文件中定义的所有*类*实体,但是如果一个*类*的扩展 是定义在独立的源文件中,那么就不能访问这个*类*的*private*成员。
	+ 访问级别的使用原则： **访问级别统一性**
	+ Framework的访问级别: 对外的接口定义为`public`
	+ 单元测试目标的访问级别		`@testable`
- 自定义类型
	+ 一个`public`类的所有成员的访问级别默认为`internal`级别
	+ 一个`private`类的所有成员的访问级别默认为`private`级别
	+ 元组类型  
	  元组的访问级别是在它被使用时自动推导出, 元组的访问级别与元组中访问级别最低的类型一致。
	+ 函数类型  
	  函数的访问级别需要根据该函数的参数类型和返回类型的访问级别得出
	+ 枚举类型  
	  * 不能为枚举中的成员单独申明不同的访问级别
	  * 枚举定义中的任何原始值或关联值的类型都必须有一个访问级别
- 子类 
	+ 子类的访问级别不得高于父类的访问级别。
	+ 只要满足子类不高于父类访问级别以及遵循各访问级别作用域的前提下(即 private的作用域在同一个源文件 中, internal的作用域在同一个模块下),我们甚至可以在子类中,用子类成员访问父类成员,哪怕父类成员的 访问级别比子类成员的要低
- 常量、变量、属性、下标
	+ 常量、变量、属性不能拥有比它们的类型更高的访问级别
- 初始化
- 协议
- 扩展
- 



-----------------
值类型	类类型	引用类型 
逆向建模

unwrapped	解析
- 像 Swift 中其他类型一样,它们的名字(例如 CompassPoint 和 Planet )必 须以一个大写字母开头。
## 问题
------------
- 可选绑定 if语句中 赋值运算结果怎么会变成Boll值？
- 

---------
- 值类型被赋予给一个变量、常量或者本身被传递给一个函数的时候,实际上操作的是其的拷贝.
- 所有的基本类型:整数(Integer)、浮点 数(floating-point)、布尔值(Boolean)、字符串(string)、数组(array)和字典(dictionary),都是值 类型,并且都是以结构体的形式在后台所实现。
- 所有的结构体和枚举类型都是值类型
- 引用类型：类




	
   
        