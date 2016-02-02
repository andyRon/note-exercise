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
		
### 继承
		
		
		

### 补充
"/Users/andyron/myfield/github/note-exercise/ios/OC/Objective-C基础教程/3/3.2.2 Shapes-Object/3.2.2 Shapes-Object/main.m:11:20: Must explicitly describe intended ownership of an object array parameterd"  (http://blog.csdn.net/gogler/article/details/29877001)