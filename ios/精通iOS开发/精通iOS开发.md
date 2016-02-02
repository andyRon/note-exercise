

### 1
- *沙盒*  应用用于存储文档、首选项等任何必要数据的地方

### 2
- Xcode 结构
    1. toolbar
        * 活动视图(activity view)   中间
        * 右侧  用于切换
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
- Xcode快捷键和常用菜单
    + `command + 0  ~  command + 8` 分别对应navigator
    + `command + option + 0  ~  command + option + 6` 对应 Attributes Inspector
    + `command + option + control + 0  ~  command + option + control + 4`  对应 Library
    + `Command + Shift + o`  切换至某个文件或者找到特定的代码行
    + `option + command + return`(View>Assistant Editor>Show Assistant Editor) 打开辅助编辑器
    + `Editor>Canvas>Show Bounds Rectangles`   显示控件边框
    + `Editor>Resovle Auto layout issues>Add Missing Constraints`  添加限制
    + `Command+Shift+C` 打开控制台
- 专有名词、概念等
    - iOS Human Interface Guidelines(HIG)


### 3 实现基本交互

1. MVC方法
    - 尽量不要包含哪些可能被认为属于多个分类的功能
3. 视图控制器
    - 应用程序委托(application delegate)
    - 输出接口(outlet)  
        `IBOutlet`(告诉Xcode，这个属性会与nib文件中的对象关联)
    - 操作方法(action method) or 操作
    - 
4. 应用程序委托
asv
### 4 
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

### 7 分页栏与选取器
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





### 参考
- [Debug Your app](http://www.cocoachina.com/ios/20141128/10358.html)
### 进阶知识
- [RunLoop](http://www.cocoachina.com/ios/20150601/11970.html)
- Core text [1](http://www.cocoachina.com/industry/20140521/8504.html)
- AVFoundation [1](http://www.cocoachina.com/ios/20150528/11966.html)

http://developer.apple.com/library/ios/#samplecode/UICatalog/index.html

http://learncocoa.org
http://forum.learncocoa.org 
