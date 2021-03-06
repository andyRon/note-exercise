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
    self.window = UIWindow(frame: UIScreen.main.bounds)
    self.window?.rootViewController = MyViewController()
    self.window?.backgroundColor = UIColor.white
    self.window?.makeKeyAndVisible()
    ```

    ```
    let w = UIApplication.shared.delegate!.window
    let w = (UIApplication.shared.delegate as! AppDelegate).window!
    let w = UIApplication.shared.keyWindow!
    ```

- Subview and Superview
    + 操作视图（添加、删除视图等）时可以使用一些事件方法，这些方法都在`UIView`中
    ```
    • willRemoveSubview(_:),didAddSubview(_:) 
    • willMove(toSuperview:),didMoveToSuperview 
    • willMove(toWindow:),didMoveToWindow

    • insertSubview(at:)
    • insertSubview(belowSubview:),insertSubview(aboveSubview:) 
    • exchangeSubview(at:withSubviewAt:)
    • bringSubview(toFront:),sendSubview(toBack:)
    ```

- Visibility and Opacity

- Frame
    + view的`frame`, a CGRect, is the position of its rectangle within its super‐ view, in the superview’s coordinate system.
    + `UIView.sizeToFit()`

- Bounds and Center ??
    + bounds是以own coordinates为标准
    + center是frame的中心
    + increased the superview’s origin in the positive direction, but the subview moved in the negative direction
    + changing a view’s frame size affects its bounds size
    + Changing a view’s bounds does not change its center; changing a view’s center does not change its bounds. view的bounds和center是相互独立的
    + frame改变，bounds和center会相应变化以适应；bounds或center改变，frame会相应改变以适应
    + `convert` ??

- Window Coordinates and Screen Coordinates
    + The device screen has no frame, but it has bounds.

- Transform
    + view's `transform`(CGAffineTransform) change the view’s apparent size and orientation — without affecting its bounds and center.


- Trait Collections and Size Classes


