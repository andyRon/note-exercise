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


### 3 




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

