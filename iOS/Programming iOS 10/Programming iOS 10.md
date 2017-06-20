[code]( http://github.com/mattneub/Programming-iOS-Book-Examples)

## Part 1 Views
```
UIResponder
    UIApplication
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
```




### Chapter 1 Views 
> 一个是视图就是一个UIView类的对象或者其子类，
> 
> A view is also a responder (UIView is a subclass of UIResponder). This means that a view is subject to user interactions, such as taps and swipes. 

- The Window
    + 开始发生了：
        1. AppDelegate.swift文件中的`@UIApplicationMain`表示使用`UIApplicationMain` function来实例一个`UIApplication`，并且保存这个实例，代码中用`UIApplication.shared`表示
        2. `UIApplicationMain` 根据 Info.plist 中的key “Main storyboard file base name” (UIMainStoryboard- File)，判断是否使用和使用哪个storyboard
        3. `UIApplicationMain` 实例`UIWindow`，并分配给the app delegate’s window property，在AppDelegate.swift中表示为`self.window`，在app运行期间都存在；然后设置the window’s frame to the screen’s bounds. 
        4. `UIApplicationMain`  实例 initial view controller，并分配给the window’s rootView- Controller property，也就是`self.window?.rootViewController?`，立马又生成一个the main window’s root view，表示为`self.window?.rootViewController?.view`。
        5. `UIApplicationMain` calls the app delegate’s application(_:didFinishLaunching- WithOptions:).
        6. `UIApplicationMain`调用`makeKeyAndVisible`使视图可见
    + 如果没有a main storyboard，就要在`application(_:didFinishLaunchingWithOptions:)`中，代码完成上述动作
    ```
    self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
    self.window?.rootViewController = ViewController()
    self.window?.backgroundColor = UIColor.whiteColor()
    self.window?.makeKeyAndVisible(
    ```



