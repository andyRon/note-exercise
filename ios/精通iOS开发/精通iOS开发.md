

### 1
- *沙盒*  应用用于存储文档、首选项等任何必要数据的地方

### 2
- Xcode 结构
    1. toolbar
        * 活动视图(activity view)   中间
        * 右侧(左边三个)  用于切换
            + standard editor
            + assistant editor
            + version editor
    2. navigator
        * project navigator(源代码文件、图片文件、数据模型、属性列表等)
        * symbol navigator(编译器能识别的：OC类、枚举类型、结构体、全局变量)
        * find navigator
        * issues navigator
        * test navigator
        * debug navigator
        * breakpoint navigator
        * log navigator
    3. jump bar(跳转栏)  
        Recent Files, Unsaved Files, Counterparts(关联文件), Superclasses(父类), Subclasses, Siblings(兄弟类), Categories(类别), Include（引用文件)...
    4. The Utility Area(实用工具面板，右侧)
        * Attributes Inspector(属性检查器)
        * Library
            + file template
            + code snippet
            + object
            + media
    5. Interface Builder(界面构建器)
    6. New Compiler and Debugger
        - LLVM(Low Level Virtual Machine, 底层虚拟机)
        - static analyzer(静态分析器)Xcode

- 界面构建器
    + 文件格式的演变
        * nib(二进制)
        * xib(xml)
        * storyboard(分镜，xml,“元nib文件”)：可以包含多个视图和控制器，以及如何在应用运行时相互连接的配置信息
    + 分镜
        * 屏幕上显示的所有用户界面元素(包括按钮、文本框、标签等)都继承自UIView
    + 库
    + 按钮和其他很多控件都不包含子视图
    + 界面构建器不会生成任何需要手动维护的代码
    + 把对象序列化到分镜或nib文件中

- 美化应用
    - 像素(ppt, pixels per inch), 点(pt, point)
    - 58 80 120 
- Xcode快捷键和常用菜单
    + `command + 0  ~  command + 8` 分别对应navigator
    + `command + option + 0  ~  command + option + 6` 对应 Attributes Inspector
    + `command + option + control + 0  ~  command + option + control + 4`  对应 Library
    + `Command + Shift + o`  切换至某个文件或者找到特定的代码行
    + `option + command + return`(View>Assistant Editor>Show Assistant Editor) 打开辅助编辑器
    + `Editor>Canvas>Show Bounds Rectangles`   显示控件边框
    + `Editor>Resovle Auto layout issues>Add Missing Constraints`  添加限制
    + `Command+Shift+C` 打开控制台
    + `command＋shift＋O` 打开（搜索）头文件
- 专有名词、概念等
    - iOS Human Interface Guidelines(HIG)


### 3 实现基本交互

1. MVC方法
    - 尽量不要包含哪些可能被认为属于多个分类的功能
3. 视图控制器
    - 应用程序委托(application delegate, AppDelegate.h, AppDelegate.m)
    - 输出接口(outlet)  
        `IBOutlet`(告诉Xcode，这个属性会与nib文件中的对象关联)
    - 操作方法(action method) or 操作  `IBAction`
        + 不接受任何参数
        + 或只接受一个参数(指向触发该方法的对象的指针，sender)
    - 设计用户界面
        + Xcode 对按钮和操作方法等的关联信息存储在分镜文件中。
    - 样式文本 `NSAttributedString` 

4. 应用程序委托
    - **委托(delegate)**：负责为其他对象处理特定任务的对象
    - 每个iOS应用程序都有且仅有一个UIApplication实例，它负责应用程序的运行循环，以及处理应用程序级的功能(比如把输入信息分发给恰当的控制器类)。
    - 在应用程序执行过程中的某些特定时间点，UIApplication将会调用特定的委托方法(如果委托对象存在，并且实现了相应的委托方法)。


### 4 更丰富的用户界面
2. 活跃控件、静态控件和被动控件
    - 大多数控件都支持被动模式，并且所有控件都支持静态或者不可见模式。
    - 如果一个控件可以触发多个操作方法，可能会导致应用出现意料之外的行为。

    Apply Retina 3.5-inch Form Factor


### 5
Horizontal Spacing  >>>   stack view  ？？
pin  在编辑窗口右下角



### 6 多视图应用
1. 多视图应用的常见类型
    1. 内容视图： 具有相应视图控制器的UIView或其子类
    2. 标签栏应用（电话和时钟应用）    标签栏(Tab Bar)
    3. 基于导航的应用（系统设置） **导航控制器**  **分割视图**(split view)
    4. 工具栏应用（Safari）
2. 多视图应用的体系结构

3. 构建View Switch项目
Empty Application模板消失了  [解决办法1](http://jingyan.baidu.com/article/2a138328bd73f2074b134f6d.html)  
解决办法2
https://github.com/featherJ/Empty-Application-For-Xcode-7
复制 `Empty Application.xctemplate` 到目录`{Xcode.app}/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/Project Templates/iOS/Application/` 中
Cocoa class 

报错 ， 模拟机一直黑屏vrs

### 7 分页栏与选取器 *
- ？？`no code sigining identities found`
- ？？命令栏提示` Failed to instantiate the default view controller for UIMainStoryboardFile 'Main' - perhaps the designated entry point is not set?` [解决](http://blog.csdn.net/jiajiayouba/article/details/41678101)  主要是没有第一启动界面引起的，
- `NSDateFormatter` 定制日期格式

 **picker view**(选择器视图，选择器)  
 1. Pickers应用程序
    - 日期选择器
    - 单滚轮选取器
    - 多滚轮选取器
    - 包含依赖滚轮的选取器
    - 包含图像的自定义选取器
 2. 委托和数据源
 3. 创建Pickers应用程序
    - 创建视图控制器  
     根控制器  `UITabBarController`
 4. 
5. 实现单滚轮选取器 
    - 数据来源：
        1. 静态列表
        2. 文件或URL载入
        3. 动态组合或计算得到


### 8 表视图简介

3. 定制表视图单元


    - 3.2  `command+N` -> `OS X Source - Cocoa Class`



### 9 导航控制器和表视图
1. 导航控制器 
2. 一个简单的字体浏览器：Fonts
    - Fonts应用的基础框架
        + `General > Deplyment Info > Main Interface`
3. 

4.  报错卡在*
2016-02-17 15:50:23.209 Fonts[29296:1936992] -[FavoritesList copyWithZone:]: unrecognized selector sent to instance 0x7fa7d155f060
2016-02-17 15:50:23.213 Fonts[29296:1936992] *** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '-[FavoritesList copyWithZone:]: unrecognized selector sent to instance 0x7fa7d155f060'
5. 第一个


### 10 集合视图



### 11 iPad开发注意事项

1. 分割视图(横向)和浮动窗口(纵向)

2. 显示总统信息
    - ？？ msterview选择总统，DetailView中的text不变化？w

3. 创建浮动窗口


### 12 应用设置及用户默认设置  
`NSUserDefaults`
`沉浸式应用`


**Utility Application**

### 13 数据持久化基础知识
- iphone 模拟器在mac上的具体地址
`/Library/Application Support/iPhone Simulator/`

`/Users/username/Library/Application Support/iPhone Simulator/`

2. 文件保存方案






