[Swift100Tip](http://swifter.tips/)  
## 王巍的
------------

### @Selector

### 柯里化 (Currying)  最新版本已经删除

### 将 protocol 的方法声明为 mutating  
让实现协议的`struct`和`enum`中的方法中能够修改变量

### Sequence   
IteratorProtocol    GeneratorType   SequenceType

### 多元组 (Tuple)

### @autoclosure 和??

### Optional Chaining

### 操作符
- 与 Objective-C 不同，Swift 支持重载操作符这样的特性

### func 的参数修饰
- Swift 其实是一门讨厌变 化的语言。所有有可能的地方，都被默认认为是不可变的，也就是用 let 进行声明的。
- 默认情况下所有参数都是 let 的

### Swift 命令行工具
- 启动 REPL 环境: ` xcrun swift`。（REPL 环境只是表现得像是即时的解释执行，但是其实质还是每次输入代 码后进行编译再运行。）
- 直接将一个 .swift 文件作为命令行工具的输入
```
// hello.swift
#!/usr/bin/env xcrun swift
print("hello")
// Terminal
> chmod 755 hello.swift
> ./hello.swift
// 输出: hello
```
- 直接脱离 Xcode 环境进行编译和生成可执行的二进制文件
```
// MyClass.swift
class MyClass {
    let name = "Andy Ron" 
    func hello() {
        print("Hello \(name)")
    }
}
// main.swift
let object = MyClass() 
object.hello()
```

`xcrun swiftc MyClass.swift main.swift` (生成一个名叫 main 的可执行文件)

```
> ./main
// 输出:
// Hello Andy Ron
```

- 生成汇编级别的代码     `swiftc -O hello.swift > hello.asm`
- `xcrun swift --help`   `xcrun swiftc --help` 

### 字面量转换

### 下标

### 方法嵌套

### 实例方法的动态调用
- 通过类型取出这个类型的某个实例方法的签名，然后再通过传递实例来拿到实际需要调用的方法。
```
class MyClass {
    func method(number: Int) -> Int {
        return number + 1
    }
}
let f = MyClass.method
let object = MyClass()
let result1 = f(object)(1)
```

### 命名空间
- Objective-C 一个一直以来令人诟病的地方就是没有命名空间。Objective-C 的类型一般都会加上两到三个字母的前缀
- Swift 的命名空间是基于 module 而不是在代码中显式地指明，每个 module 代表了 Swift 中的一个命名空间。同一个 target 里的类型名称还是不能相同的。

### 单例 ??

### Any 和 AnyObject
- Any 和 AnyObject 是 Swift 中两个妥协的产物

### 随机数生成
- 最让程序员郁闷的事情莫过于程序有时候会崩溃而有时候又能良好运行。

### typealias 和泛型接口
- 必须指定将某个特定的类型通过 typealias 赋值为新名 字，而不能将整个泛型类型进行重命名。

### 条件编译
```
#if <condition>
#elseif <condition>
#else
#endif
```
- os()      OSX, iOS
- arch()    x86_64, arm, arm64, i386
```
#if os(OSX)
typealias Color = NSColor #else
typealias Color = UIColor #endif
```

### 编译标记
- `// MARK: xxx`
- `// MARK: - xxx`   在导航栏上多一点 分割线
- `// TODO: xxx`    `// TODO: - xxx`  
- `// FIXME: xxx`   `// FIXME: - xxx`

### 可变参数函数
- 可变参数只能作为方法中的最后一个参数来使用
- 可变参数都必须是同一种类型的

### @UIApplicationMain

### 初始化方法顺序
- 与 Objective-C 不同，Swift 的初始化方法需要保证类型的所有属性都被初始化。所以初 始化方法的调用顺序就很有讲究。
- 在某个类的子类中，初始化方法里语句的顺序并不是随意的，我们需要保证在当前子类实例的成员初始化完成后才能调用父类的初始化方法
```
class Cat {
    var name: String
    init() {
        name = "cat" 
    }
}
class Tiger: Cat {
    let power: Int
    override init() {
        power = 10
        super.init()
        name = "tiger"
    }
}
```
- 子类的初始化顺序
    1. 设置子类自己需要初始化的参数，power = 10
    2. 调用父类的相应的初始化方法，super.init()
    3. 如有必要，对父类中的需要改变的成员进行设定， name = "tiger"
- Swift 会自动地对父类的对应 init 方法进行 调用，也就是说，第 2 步的 super.init() 也是可以不用写的 (但是实际上还是调用的， 只不过是为了简便 Swift 帮我们完成了)。

### Designated，Convenience 和 Required

### 初始化返回 nil ??

### protocol 组合 ??

### static 和 class

### @objc 和 dynamic
- 虽然说 Swift 语言的初衷是希望能摆脱 Objective-C 的沉重的历史包袱和约束，但是不 可否认的是经过了二十多年的洗礼，Cocoa 框架早就烙上了不可磨灭的 Objective-C 的 印记。无数的第三方库是用 Objective-C 写成的，这些积累无论是谁都不能小觑。因此， 在最初的版本中，Swift 不得不考虑与 Objective-C 的兼容。

### 可选接口

### 多类型和容器

### 内存管理，weak 和 unowned

### @autoreleasepool

### default 参数

### 正则表达式

### 模式匹配

### 值类型和引用类型

### Foundation框架
- Swift 与 Foundation 之间的类型转换是可以自动完成的，而且是双向的。 ??
- 对应关系
    + String - NSString
    + Int, Float, Double, Bool 以及其他与数字有关的类型 - NSNumber 
    + Array - NSArray
    + Dictionary - NSDictionary

### String 还是 NSString
- 尽可能的话还是使用原生的 String 类型

### UnsafePointer
- 在 Swift 的思想中，所有的引用或者变 量的类型都是确定并且正确对应它们的实际类型的，你应当无法进行任意的类型转换， 也不能直接通过指针做出一些出格的事情。
- 为了与庞大的 C 系帝国进行合作，Swift 定义了一套指针的访问和转换方法，那就是 UnsafePointer 和它的一系列变体。

### C 指针内存管理

### COpaquePointer 和 CFunctionPointer

### GCD 和延时调用

### ... 和..<

### 获取对象类型
- `type(of: )`

### AnyClass，元类型和.self

### 接口和类方法中的 Self

### 自省 Introspection ??
- 程序设计和人类哲学所面临的同一个很重大的课题就是解决 “我是谁” 这个问题。
- 向一个对象发出询问，以确定它是不是属于某个类，这种操作就称为自省。

### 类型转换

### 动态类型和多方法

### 属性观察

### KVO

### 局部 scope

### Printable 和 DebugPrintable

### 判等

### 哈希

### 错误处理

### 断言

### fatalError

### final

### 类簇

### 代码组织和 Framework

### Playground 延时运行

### Playground 可视化

### Playground 与项目协作

### Playground 限制

### Swizzle

### lazy 修饰符和 lazy 方法

### find

### 数学和数字

### JSON

### NSNull

### 调用 C 动态库

### Reflection 和 MirrorType

### 输出格式化

### 文档注释

### Options

### 性能考虑

### 数组 enumerate

### 类型编码 @encode

### Log 输出

### C 代码调用和 @asmname

### sizeof 和 sizeofValue

### 多重 Optional

### Optional Map

### 溢出

### 宏定义 define

### delegate

### Associated Object

### Lock

### 属性访问控制

### Swift 中的测试

### Core Data

### Toll-Free Bridging 和 Unmanaged

### 闭包歧义

### 泛型扩展

### 兼容性

### 列举 enum 类型





