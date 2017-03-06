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




