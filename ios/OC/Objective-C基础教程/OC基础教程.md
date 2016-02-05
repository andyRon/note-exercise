## 《Objective-C基础教程》
### 1.开始
1. Cocoa(OS X), Cocoa Touch(iOS)
2. NeXT公司 -> NextSTEP(OC开发的用户界面工具包) -> 更名为COcoa
### 2.对C的扩展
1. .m代表message
2. `#import`类似于`#include`，`#import`可保证头文件只被包含一次
3. 框架：一种把头文件、库、图片、声音等内容聚集在一个独立单元中的集合体。
	- 如Cocoa,Carbon,QuickTime,OpenGL
	- Cocoa包括Foundation和Application Kit(AppKit)
	- 每一个框架都有一个主头文件，它包含了框架内所有的头文件。
	- Foundation的头文件 1MB 14000行 100多文件 。通过`#import <Foundation/Foundation.h>` 就获得了整个集合
	- Xcode使用预编译头文件（一种经过压缩的，摘要形式的头文件）来加快读取速度。
	- `/System/Library/Frameworks/Foundation.framework/Header/`
4. NSLog()和@"字符串"
	- `NS`前缀是NextSTEP
	- `NSLog()`类似于`printf()`	
	- @符号是Objective-C在标准C语言基础上添加的特性，意味着引号内的字符串应作为Cocoa的NSString元素来处理
	- `@`符号可以看成之后是对C语言的扩展
5. 布尔类型  
	`YES` 1 `NO` 0  (注意与C语言的区别)
	
6. 创建OC程序
	 - 创建project `command+shift+N`
	 - OS X > Command Line Tool  
### 3.面向对象编程的基础知识
1. 间接(indirection)
	- **"只要再多添加一层间接，计算机科学中就没有解决不了的问题"**
	- 电话薄
	- 让他人代替你自己去完成工作
	- 编写一段代码来查询其他代码，并通过它继续访问另一层代码。
	- 推诿
	- **变量与间接**
	- **使用文件名的间接**
	- `/usr/share/dict/words`
2. 在面向对象编程中使用间接
	> 使用间接来调用代码，不是直接调用某个函数，而是间接调用。 
	- 过程式编程(Procedual Programming)
		+ 修改过去正常工作的代码很可能会引入新的错误
		+ 代码例子 `3.2.1 Shapes-Procedural`
		+ 修改过去正常工作的代码很可能会引入新的错误
	- 面向对象编程
		+ **以数据为中心，函数为数据服务**
		+ 代码例子 `3.2.2 Shapes-Object`
		+ `id`是一种泛型，可以用来引用任何类型的对象(id实际上是一个指向结构体的指针)b
		+ 方括号在OC中其他意义：用于通知某个对象该去做什么。`[shape draw];`表示通知shape对象执行draw操作
		+ **发送消息**（调用方法）：通知对象执行某种操作
		+ 类是一种能够实例化成对象的结构体		
		
		
	
		
3. 有关术语
	- class
	- object
	- instance
	- message
	- method
	- method dispatcher
	- interface
	- implementation
4. OC中的OOP
	1. `@interface`	OC编译器需要一些有关类的信息（）
		+ **instance variable**(实例变量)   
			**method declaration**(方法声明)
		+ `-` 是区分函数原型(没有)与方法声明
		+ **infix notation**(中缀符)  
			`[circle setFillColor: kRedColor]` 表示调用带一个参数的方法
		+ 如果方法使用参数，则需要冒号，否则不需要冒号
		+ 提倡@end语言后添加注释来注明类的名称s
	2. `@implementation` 定义类的公共接口
		+ @implementation中定义那些在@interface中没有声明过的方法
		+ OC中不存在真正的私有方法
	3. 实例化对象
		+ **instantiation**
		+ 实例变量 ivar
		+ `[Circle new]`	发送new消息
		+ **软件实体应该对扩展开放，而对修改关闭。**	  ---- 开放/关闭原则(Bertrand Meyer)
		
### 4 继承(inheritance)
1. 为何使用继承
	- **UML**(Unified Modeling Language, 统一建模语言) 是一种用图表来表示类、类的内容以及它们之间关系。
2. 继承的语法格式
	- 只能继承一个
	- 只有代码精简，bug才无处藏身
	- 相关术语
		+ refactoring (重构)
		+ superclass
		+ parent class
		+ subclass
		+ child class
		+ override
3. 继承的工作机制
	- 方法调度
	- 实例变量  
		+ **polymorphism**(多态性)
		+ self
		
4. 重写方法

### 5 复合(composition)
1. 什么是复合
2. 自定义NSLog()

### 6 源文件组织
1. 拆分接口和实现
	- 接口部分(.h)：类的@interface指令、公共struct定义、enum常量、#defines和extern全局变量等。
	- 实现部分(.m): 类的@implementation指令、全局变量的定义、私有struct等。
	- 复杂的项目可以拥有多个目标，它们源文件的配置各不相同，构建规则也不同
	- 群组关系仅仅是有Xcode负责管理的一项奇妙的功能
2. 拆分Car程序
	- `#import` 带尖号的是导入系统文件(只读)
	
3. 使用跨文件依赖关系
	- dependency
	- `@class` 是告诉编译器：“这是一个类，只会通过指针来引用它，不需要关注此类的更多信息”
	- 编译器需要先知道所有关于超类的信息才能成功地为其子类编译@interface部分
	
	
### 7 


1. code completion
	+ 符号的意义
		* P -- 协议
		* M -- 成员方法
		* C -- 类
		* K -- 枚举 、常量
		* V -- 成员变量
		* T -- typedef类型
		* G -- 全局变量
		* f -- 函数	

5 检查程序
	- detatips 只在debug时
	
	
5. 调试 
	- caveman debugging(暴力测试)
	- xcode调试器
		+ GDB
		+ LLDB
	- GUI程序 vs 命令行
	
### 8 Foundation Kit *

3. 一些有用的数据类型
	- `NSRange`
	- 几何数据类型（CG前缀） **Core Graphics框架**提供  
		`CGPoint`  `CGSize`  `CGRect`  `CGPointMake()`  `CGSizeMake()`  `CGRectMake()`

4. 字符串  
	
	
### 9 内存管理 *

1. 对象生命周期  
	诞生 （alloc或new）  
	生成 （接受消息并执行操作）  
	交友 （通过复合以及向方法传递参数）  
	死去 （被释放）  
	- reference counting / retain counting(保留计数)
		+ `- (id) retain;`
		+ `- (oneway void) release;`
		+ `- (NSUInteger) retainCount;`
		+ 一般不直接调用`dealloc`方法；
	- object ownership
	- 访问方法中的保留和释放
	— 自动释放池
		+ 弄清楚什么时候不再使用一个对象并不容易
	- 所有对象放入池中
		+ autorelease pool(自动释放池)   `@autoreleasepool`  `NSAutoreleasePool` 
	- autorelease pool的销毁时间
	- autorelease pool的工作流程
2. Cocoa的内存管理规则
	
3. 异常


### 10 对象初始化  
  `[[类名 alloc] init]`  分配 后 初始化  
  
1. 分配对象  
	alloc方法顺便将分配的内存全部初始化为0   
	- 初始化对象
	- 编写初始化方法
	- 初始化时要做什么  
		**lazy evaluation** 惰性求值
2. 便利初始化函数
	- `- (id) init;`  
	`NSString *emptyString = [[NSString alloc] init];`
	- `- (id) initWithFormat: (NSString *) format, ...;`
	- `initWithContentsOfFile:encoding:error:`
	

### 11 属性
1. 使用属性值
	- `@property` 预编译指令的作用是自动声明属性的setter和getter方法
	- `@synthesize` 创建了该属性的访问代码 
2. 属性扩展
	- `@property (nonatomic, assign, atomic)`  
	- `@dynamic`
	- `@property (getter=isHidden) BOOL hidden;`
	- 特性不支持需要接收额外参数的方法
	
### 12 类别
	

		
		
		

### 补充
- "/Users/andyron/myfield/github/note-exercise/ios/OC/Objective-C基础教程/3/3.2.2 Shapes-Object/3.2.2 Shapes-Object/main.m:11:20: Must explicitly describe intended ownership of an object array parameterd"  (http://blog.csdn.net/gogler/article/details/29877001) 
 Automatic Reference Counting 变为No
 
 
 - `'retain Count' is unavailable: not available in automatic reference counting mode`   解决方法同上
 
 - 比较  initwithformat stringwithformat