
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


