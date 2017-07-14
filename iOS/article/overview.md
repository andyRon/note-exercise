
### Framework
- https://developer.apple.com/library/content/documentation/MacOSX/Conceptual/BPFrameworks/Concepts/WhatAreFrameworks.html
- A framework is a hierarchical directory that encapsulates shared resources, such as a dynamic shared library, nib files, image files, localized strings, header files, and reference documentation in a single package.
- A simple framework bundle
```
MyFramework.framework/
    MyFramework  -> Versions/Current/MyFramework
    Resources    -> Versions/Current/Resources
    Versions/
        A/
            MyFramework
            Resources/
                English.lproj/
                    InfoPlist.strings
                Info.plist
        Current  -> A
```
- Framework Versions : major (or incompatible) and minor (or compatible) versions

### NSBundle  ios路径相关

### iOS中的URL Scheme
https://sspai.com/post/31500#09

### Unwind Segue  
https://stackoverflow.com/questions/12561735/what-are-unwind-segues-for-and-how-do-you-use-them
- **unwind segue** (**exit segue**)
- **unwind segue**时需要一个特殊的action
```
@IBAction func unwindToThisViewController(segue: UIStoryboardSegue) {
}
```
- `UIStoryboardSegue`



### 关于UIFont
- https://www.cocoanetics.com/2010/02/understanding-uifont/
- http://www.cyrilchandelier.com/understanding-fonts-and-uifont
- https://stackoverflow.com/questions/31771679/uifont-how-to-get-system-thin-font

### iOS 中的 富文本
- http://www.cnblogs.com/goodboy-heyang/p/5143135.html
- NSMutableAttributedString 
var labelText = "人生若只如初见，何事秋风悲画扇。\n等闲变却故人心，却道故人心易变。\n骊山语罢清宵半，泪雨霖铃终不怨。\n何如薄幸锦衣郎，比翼连枝当日愿。"
        var attrStr = NSMutableAttributedString(string: labelText)
        attrStr.addAttribute(NSFontAttributeName, value: UIFont.systemFont(ofSize: 30.0), range: NSMakeRange(0, 3))
        attrStr.addAttribute(NSForegroundColorAttributeName, value: UIColor.red, range: NSMakeRange(17, 7))
//        attrStr.addAttribute(NSUnderlineStyleAttributeName, value: NSUnd, range: <#T##NSRange#>)
//        label.text = labelText
        label.attributedText = attrStr

### NSRange

###  iOS 读取图片的各种方法

### iOS中Info.plist文件的常见配置

### UIControlEvents

### Selector的最新写法  `#selector(ViewController.touchUpInside)`

### `IBDesignable` `@IBInspectable` 
Marked with @IBInspectable (or IBInspectable in Objective-C), they are easily editable in Interface Builder’s inspector pane
就是定制了UI时，在xcode的属性列表中会显示
@IBDesignable
open class ZFRippleButton: UIButton {
    
    @IBInspectable open var ripplePercent: Float = 0.8 {
        didSet {
            setupRippleView()
        }
    }
    
    @IBInspectable open var rippleColor: UIColor = UIColor(white: 0.9, alpha: 1) {
        didSet {
            rippleView.backgroundColor = rippleColor
        }
    }
    
    @IBInspectable open var rippleBackgroundColor: UIColor = UIColor(white: 0.95, alpha: 1) {
        didSet {
            rippleBackgroundView.backgroundColor = rippleBackgroundColor
        }
    }
    
    @IBInspectable open var buttonCornerRadius: Float = 0 {
        didSet{
            layer.cornerRadius = CGFloat(buttonCornerRadius)
        }
    }
    
    @IBInspectable open var rippleOverBounds: Bool = false
    @IBInspectable open var shadowRippleRadius: Float = 1
    @IBInspectable open var shadowRippleEnable: Bool = true
    @IBInspectable open var trackTouchLocation: Bool = false
    @IBInspectable open var touchUpAnimationTime: Double = 0.6

### iOS开发证书问题

### UIViewContentMode

### Storyboard  辅助线 虚线

### json解析方法总结
https://developer.apple.com/swift/blog/?id=37
http://tangplin.github.io/swiftyjson/
https://www.raywenderlich.com/150322/swift-json-tutorial-2

###  Constrain to margins

### iOS应用程序一般的五个状态
生命周期

### CALayer  UIKit

### swift 文档注释
Headerdoc
http://swifter.tips/documentation/
http://ericasadun.com/2015/06/14/swift-header-documentation-in-xcode-7/

### NSFileManager

### iOS 获取参数

