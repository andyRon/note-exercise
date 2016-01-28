

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




http://developer.apple.com/library/ios/#samplecode/UICatalog/index.html

http://learncocoa.org
http://forum.learncocoa.org 
