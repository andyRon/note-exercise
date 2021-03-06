iOS开发指南(从Hello World到App Store上架)(第4版)
---------------------------------------------

### 2 
- 基础文件介绍
    + 两个类  
        * `AppDelegate` 继承 `UIResponder`(处理响应事件), 实现 `UIApplicationDelegate`(成为应用程序委托对象，继承的方法在应用生命周期的不同阶段被调用)  
        * `ViewController` 继承 `UIViewController` (根视图和用户事件控制类)
    + 两个界面布局文件
        * Main.storyboard 故事板文件
        * LaunchScreen.storyboard 应用启动界面故事板文件
    + Assets.xcassets 资源目录
    + Info.list 工程属性文件 
- 应用生命周期 


### 3 Cocoa Touch 框架与构建应用界面

### 4 UIView与视图

### 5 委托协议、数据源协议、与高级视图

### 6 表视图
- 概述
    + **表头视图** **表脚视图** **单元格** **节**（节头、节脚）
    + 表视图分类
        * 普通表视图
        * 分组表视图
    + 索引列、选择列、搜索栏

- 6.4 添加搜索栏 
    + 搜索栏通过`UISearchController`代码实现，其他部分通过Interface Builder实现
    + ??? `NSPredicate`   SQL HQL(Hibernate Query Language)

- 6.6 StaticTable项目的 login按钮的不能关联方法??? (疑：swift，xcode的版本问题)


### 7 界面布局与屏幕适配
状态栏 20  导航栏 44  标签栏 49

- 传统布局技术
尺寸检查器 > Autoresizing      设置固定边距
- Auto Layout 布局
    + 传统布局只能设置视屏与屏幕的上下左右边距，不能设置屏幕中视图之间的距离
    + Constant是约束值；Priority是约束等级
- iOS9 堆视图 StatckView
- iOS屏幕的多样性
    `UIDevice`
- Size Class 与 iOS多屏幕适配(>=iOS8) xCode8修改这个操作（？？？）
    + Size Class 不能通过代码编程管理，只能通过IB使用
- 资源目录与图片资源适配
    - assets.xcassets, images.xcassets 不同版本的不同名字
    
### 8 视图控制器与导航模式
- 8.1 概述
    + 导航模式
        * 平铺导航模式    天气预报应用
        * 标签导航模式    时钟应用
        * 树形结构导航模式  邮件应用 
- 8.2 模态视图 
> 临时放弃主线转到次要任务，然后在回主线
    + “模态”：必须响应处理。 **模态视图控制器** 
    + IB实现
        * *Editor -> Embed -> Navigation Controller*, 形成了一个与原视图控制器关联的 导航控制器。 如果直接拖进去应该怎么操作？ 
- 8.3 平铺导航      没有从属关系
    - 基于分屏导航的实现
    - 基于电子书导航的实现
- 8.4 标签导航 
    + **Tabbed Application**模板
        ?? app运行时执行的顺序 UITabBarController  用代码写怎么做？ 
- 8.3 树形结构导航 
    + **导航视图控制器** 与 **表视图** 的结合。  
        "树根"  
        "树干"    导航栏中的按钮不能自定义（否则用户就会迷失在应用）
        "树叶"
    + 缺点：怎样导航进来的，就要怎样原路返回


### 9 iPad应用开发 


### 10 iOS常用设计模式

- 10.3 观察者模式
    + 在软件系统中，一个对象状态的改变也会连带影响其他很多对象的状态发生改变。能够实现这一需求的设计方案有很多，但能够做到复用性强且对象之间匿名通信的，观察者模式是其中最合适的一个。
    + 实现原理
    + 在Cocoa Touch框架中，观察者模式具体应用 —— 通知（notification）机制和KVO(Key-Value Observing)机制
    + 通知机制 （**通过一个通知中心通知所有观察者对象**）
        * 广播通知(broadcast notification)、本地通知(local notification)、推送通知(push notification)
        * `NSNotificationCenter` `NSNotification`
        * NSNotification 的三个属性:
            + name 通知的名字
            + object 投送通知时传递过来的对象
            + userInfo 投送通知时定义的字典对象
        * `UIApplication` 定义几个系统通知 `UIApplicationDidEnterBackgroundNotification` `UIApplicationWillEnterForegroundNotification`
    + KVO机制 （**在对象属性变化时将通知直接发送给观察者对象**）

- 10.4 再谈MVC模式


### 11 iOS分层架构设计
设计模式 面向局部
架构设计 面向整个应用系统
可复用性和可扩展性
分层架构设计  层就是具有相似功能的类或组件的集合

- 11.1 低耦合企业级系统架构设计
**表示层**  
**业务逻辑层**  
**数据持久层**
**信息系统层**  系统的数据来源，可以是数据库、文件、遗留系统或网络数据

- 11.2 iOS分层架构设计
游戏引擎的架构一般不是分层的，而是树形结构。  
**表示层**         UIKit Framework
**业务逻辑层**      
**数据持久层**      SQLite API, Core Data, HTTP等网络通信技术
**信息系统层**      SQLite DB, 文件系统, 云服务

    * 工程（project, .xcodeproj）与工作空间（workspace, .xcworkspace）  
    出于方便管理等目的，将多个相互管理的工程放到一个工作空间中，工作空间是多个工程的集合。
    * 静态链接库  
    库是一些没有main函数的程序代码的集合。  
    静态链接库中不能有Swift代码模板，只能是OC代码模块。
    * 框架
    * 16中分层模式

- 11.4 基于同一工程的分层
    * PSSS
        - 单例设计模式与DAO设计模式没有
    * POOO
    * PSOO

- 11.5 基于同一工作空间静态链接库实现的WLSOO模式






















总结
-------------------------------
### iOS相关类
AppDelegate UIResponder <Pr>UIApplicationDelegate
ViewController UIViewController UINavigationController UITabBarController UIPageViewController UISplitViewController UIPopoverController

UIView  
    UIWindow
    UILabel
    UITableViewCell
    UIScrollView    
        UITableView UITextView UICollectionView
    UIPickerView
    UIProgressView
    UIActivityIndicatorView
    UIImageView
    UITabBar 
    UIToolBar
    UIControl   
        UIButton UIDatePicker UIPageControl UISegmentedControl UITextField UISlider UISwitch 
    UINavigationBar
    UIActionSheet
    UIAlertView
    UIWebView   WKWebView WebView
        WKNavigationDelegate 



### 错误记录 
- `Selector("testLoadData:")` 这种参数字符串中的冒号不能忘
- ATS 
---- 
erro: Error Domain=NSURLErrorDomain Code=-1022 "The resource could not be loaded because the App Transport Security policy requires the use of a secure connection." UserInfo={_WKRecoveryAttempterErrorKey=<WKReloadFrameErrorRecoveryAttempter: 0x15754c580>, NSErrorFailingURLStringKey=http://51work6.com/, NSErrorFailingURLKey=http://51work6.com/, NSUnderlyingError=0x15755fa30 {Error Domain=kCFErrorDomainCFNetwork Code=-1022 "The resource could not be loaded because the App Transport Security policy requires the use of a secure connection." UserInfo={NSErrorFailingURLStringKey=http://51work6.com/, NSLocalizedDescription=The resource could not be loaded because the App Transport Security policy requires the use of a secure connection., NSErrorFailingURLKey=http://51work6.com/}}, NSLocalizedDescription=The resource could not be loaded because the App Transport Security policy requires the use of a secure connection.}
-----
- 在StoryBoard中没有一个view controller设置了Initial Scene。
``````
2016-09-02 08:05:57.276 CustomeCell[2440:1456324] Failed to instantiate the default view controller for UIMainStoryboardFile 'Main' - perhaps the designated entry point is not set?
``````
**IS Initial View Controller** 勾选






### 疑问
1. 项目
2. Interface Builder支持在tvOS上的Dark Interface Style中自定义UI元素以及通过辅助编辑器进行预览。这个特性在新的XIB和Storyboard文件默认开启。对于现有文件可以在Identity查看器上勾选 “Use Trait Variations” 开启。
3. IB 中的 segue  统计





