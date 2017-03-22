Beginning iOS 10 Programming with Swift(by Simon Ng)
-----
[电子书官网](http://www.appcoda.com/swift/)
[电子书的一个简版](http://www.appcoda.com/learnswift/index.html)


### Preface
solidified
from scratch: 白手起家；从头做起
a couple years ago
Brick walls are there for a reason: they let us prove how badly we want things. 
人生路上有阻挡你梦想的砖墙，那是有原因的。这些砖墙让我们来证明我们究竟有多么想要得到我们所需要的。
very beginning  
From time to time
case-sensitive language
Be patient.

### Chapter 1 Getting Started with Xcode 8 Developement

### Chapter 2 Swift Playgrounds

### Chapter 3 Hello World!Build Your First App in Swift
familiarize
workspace
rightmost
utility area
Quick Help
walkthrough
A scene in storyboard represents a view controller and its views.
A view controller is designed to manage its associated view and subviews.
versus   vs

### Chapter 4 Hello World App Explained
Encapsulation
In iOS, apps are based on event-driven programming.
UI Object
illustration
empty pair of parentheses
curly brace
tons of built-in functions
pop-over
other than
- three phases:
    + **Compile**   code into machine code
    + **Package**("build")  packeage resource files(such as images, text files, sound files, etc.) 

### Chapter 5 Introduction to Auto Layout
adaptive UI
different screen dimensions
formula
live preview
- Auto layout bar

ambiguous or conflicting constraints
布局错误时 the Document Outline view dislays a disclosure arrow(red/orange)
resolve layout issues easily and quickly

- press and hold *option* key, the click *Main.storyboard(Preview)*     另外打开一个预览窗口，用户不同手机UI查看

trackpad

### Chapter 6 Designing UI Using Stack Views
> To the user, the interface is the product.

comprehensive
embed
crucial skill
sidenote 

选择困难时，the shift key and right click the stack view
- stack view 的属性
    + *alignment* *Leading*
    + *distribution* *Fill Equally*

At the very beginning of this tutorial
issue indicator in the document outline view
- an automatic way to adjust the font size on the fly. 自动调节字体大小
    + **Label** *Autoshrink* *Minimum Font Size*
- 图片尺寸限制 *Aspect Ratio*

*Need help with your coding problems? We'll find you the right developer who can help you in 15 minutes.*

To achieve adaptive layout, Apple introduced a new concept, called **Size Classes**

- Exercise??

### Chapter 7 Introduction to Prototyping
indie developer

https://designcode.io

### Chapter 8 Creating a Simple Table Based App
analogy
delegation pattern

### Chapter 9 Customise Table Views Using Prototype Cell
stylish
- delete
designate
- `RestaurantTableViewController`

customize

- UI in storyboard and code are separated.
FoodPin2 视图需要调整

图片圆
### Chapter 10 Interacting with Tabel Views and Using UIAlertController

UIAlertControllerStyle

UITableViewCellAccessoryType

### Chapter 11 Table Row Deletion, Custom Action Buttons, Social Sharing and MVC
Separation of Concerns(SoC)     MVC

`tableView(_:commit:forRowAt:)`  删除或添加行

`deleteRows(at:with:)`

swipe-for-more
`UIActivityViewController`  分享
`UITableViewRowAction`  类似于 `UIAlertAction`
`tableView(_:editActionsForRowAt:)`

- Customize `UITableViewRowAction`

颜色
https://color.adobe.com/zh/create/color-wheel/
http://www.flatuicolorpicker.com/

### Chapter 12 Introduction to Navigation Controller and Segue
drill-down interface
elegant interface
- Navigation controllers can work with any types of view controller.
- can break a large storyboard into multiple storyboards and link them up using storyboard references

//?? UILabel的长度自适应

### Chapter 13 Introduction to Object Oriented Programming
> Most good programmers do programming not because they expect to get paid or adulation by the public, but because it is fun to program.

conceptually
blueprint or prototype

### Chapter 14 Detail View Enhancement and Navigation Bar Customization
bit primitive
- `UIImageView`的 `Content Mode`属性
    + `Scale To Fill` 图片完全填满view（会缩放）
    + `Aspect Fit` 保持图片原来的尺寸（不缩放）
    + `Aspect Fill` `Clip to Bounds`勾选，图片会被剪辑

preferredStatusBarStyle: UIStatusBarStyle 
View controller-based status bar appearance
// ?? statusBarStyle修改有问题

### Chapter 15 Self Sizing Cells and Dynamic Type
// ?? UILabel 行数自动
// ??

### Chapter 16 Basic Animations, Visual Effects and Unwind Segues

`UIVisualEffectView`

 Spring animation

- 步骤
    + 在详情页右上角加*check-in*按钮
    + 添加一个*Review*视图控制器
    + 在*Review*内添加一些视图
    + 在*check-in*按钮 和 *Review*视图之间添加一个**Present modally**类型的**Segue**
    + 在*Review*中添加一个关闭按钮

//?? Unwind segues不成功
//?? 练习

### Chapter 17 Working with Maps

annotation

Both table view header and footer are not selectable. 所以就在两个*View Controller*之间设置segue.

`UITapGestureRecognizer`
`Geocoder`
placemark
`CLGeocoder`
`CLPlacemark`
- annotation的两个组成
    + an annotation object.  继承自`MKAnnotation`协议
    + an annotation view.  


### Chapter 18 Introduction to Static Table Views, UIImagePickerController and NSLayoutConstraint
添加数据
UIImagePickerController

NSPhotoLibraryUsageDescription
`NSLayoutConstraint`
A layout constraint actually defines a relationship between two user interface objects.

//??    练习

### Chapter 19 Working with Core Data
volatile

`NSPersistentContainer`

*managed object model*   *managed objects*

// 

### Chapter 20 Search Bar and UISearchController
`UISearchController`

// ?? 搜索结果有问题

### Chapter 21 Building Walkthrough Screens with UIPageViewController
`UIPageViewController`  引导页
container controller

`UIPageViewController`
`UIPageControll`

### Chapter 22 Exploring Tab Bar Controller and Storyboard References

[UITabBar](https://developer.apple.com/reference/uikit/uitabbar#//apple_ref/doc/uid/TP40007521-CH3-SW4)

Xcode 7  *storyboard references*  把大的storyboard分开便于多人合作开发

### Chapter 23 Getting Started with WKWebView and SFSafariViewController

//?? 反馈链接不可跳转

### Chapter 24 Exploring CloudKit
- CloudKit doesn't provide any local persistence and it only provides minimal offline caching support.
- containers  databases
- `CKContainer`
- the public database    the private database
- `CKDatabase`  
- `CKRecordZone`  `CKRecord`  `CKAsset`

- `try? ` is particularly useful if you do not care about the error message.

- `OperationQueue.main.addOperation {}` 添加到主线程

-  `CKQueryOperation`

- **Activity Indicator**
    + *Extra Views*
    + `UIActivityIndicatorView`
- Lazy Loading Images
    + `CKFetchRecordsOperation`

- `NSCache`  caching images

- Pull to Refresh

- saving data uing CloudKit
    + `NSTemporaryDirectory`
    + `UIImageJPEGRepresentation`
    + // ?? 保存成功但iCloud中没有

//?? Exercise






### Chapter 25 Localizing Your App to Reach More Users 
`NSLocalizedString`
*Localizable.strings*
.xliff
The export feature automatically examines the storyboard and extracts all the localizable strings, including labels and button titles.
//?? 

### Chapter 26 Deploying and Testing Your App on Real iOS Device

### Chapter 27 Beta Testing with TestFlight
**iTunes Connect**
FoodPin lets every foodie create their own food guide. You can save your favorite restaurant and discover new dining options from other foodies.

food,restaurant,recipe


- App Store Optimization(ASO)


### Chapter 29 Adopting 3D Touch
- Quick Actions, Peek, Pop

- 静态  动态 
- 最多四个Quick Actions

traitCollection.forceTouchCapability
//?? Peek pop




[中级教程简版](http://www.appcoda.com/intermediate-swift-tips/index.html)


