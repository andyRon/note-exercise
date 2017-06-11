
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
