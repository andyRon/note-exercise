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





