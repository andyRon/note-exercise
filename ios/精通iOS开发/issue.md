### 参考,问题
- No provisioning profiles found: No non–expired provisioning profiles were found.
- launchscreen.storyboard
IOS欢迎界面


- **triggered segues**
- ?? `_`  与 `self`
- Size Class 的作用是将不同尺寸的屏幕进行分类处理，而最后进行布局管理的还是Autolayout。
- 界面构建器  
蓝色引导线   
蓝色实线  约束   
橙色实线  
红色辅助线(调整视图大小时，按住option)  查看视图的距离四周的长度
- 创建视图的同时给出其相对于父视图的“对齐方式与缩放系数”(autoresizingMask)
自动布局（Auto Layout）与布局约束（Layout Constraint）
any regular compat

- Can't find keyplane that supports type 4 for keyboard iPhone-PortraitTruffle-NumberPad; using 675849259_PortraitTruffle_iPhone-Simple-Pad_Default
模拟机键盘问题 command+k


- [Debug Your app](http://www.cocoachina.com/ios/20141128/10358.html)

### 进阶知识
- [RunLoop](http://www.cocoachina.com/ios/20150601/11970.html)
- Core text [1](http://www.cocoachina.com/industry/20140521/8504.html)
- AVFoundation [1](http://www.cocoachina.com/ios/20150528/11966.html)

http://developer.apple.com/library/ios/#samplecode/UICatalog/index.html

http://learncocoa.org
http://forum.learncocoa.org 

- property中的strong 、weak、copy 、assign 、retain 、unsafe_unretained 与autoreleasing区别和作用详解

- 为什么最近的xcode的storyboard变成了正方形的？
  选中viewcontroller，去掉 **Use Size Classes**

- 使用关联检查器把委托和数据源设置为 **File's Owner** ?
- nib xib storyboard
    nib是3.0版本以前的产物，在终端下我们可以看到，NIB其实是一个文件夹，里面有可执行的二进制文件；
xib是一个基于xml的描述文件，可以实现可视化编程。
无论nib也好，xib也好，最终在执行UIViewController生命周期函数loadView之前，都会转化成可执行的nib文件。

storyboard是多个xib文件集合的描述文件，也采用xml格式。
那么storyboard与xib比较，区别在于：
一个工程中可以有多个xib文件，一个xib文件对应着一个视图控制器和多个视图。而使用storyboard时，一个工程只需要一个主storyboard文件就可以了。因此，在包含多个视图控制器的情况下，采用storyboard管理比较方便，而且storyboard还可以描述界面之间的导航关系。

- 直接复制文件到项目中没有用，因为要建立索引，所以要拖到xcode

- [xcode 把Single View Application变为Empty Application](http://jingyan.baidu.com/article/2a138328bd73f2074b134f6d.html)

- [ Failed to instantiate the default view controller for UIMainStoryboardFile 'Main' - perhaps the designated entry point is not set?
](http://blog.csdn.net/jiajiayouba/article/details/41678101)

- **Crash文件**

- [Failed to instantiate the default view controller for UIMainStoryboardFile 'Main' - perhaps the designated entry point is not set?
]
**Is Initial View Controller**