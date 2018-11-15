[iOS编程实战](https://book.douban.com/subject/25976913/)
----------------

### 1 iOS7开始新加入
- UIKit Dynamics 和 Motion Effects
UIDynamicItem
UIControl

实现运动拟真
UIDynamicAnimator <UIDynamicItem>
 UIAttachmentBehavior, UICollisionBehavior, UIGravityBehavior, UIDynamicItemBehavior, UIPushBehavior, and UISnapBehavior.

UICollectionViewLayoutAttributes <UIDynamicItem>

UIMotionEffect

- 自定义过渡效果
UIStoryboardSegue
UIViewControllerAnimatedTransitioning

- 新的多任务模式

- Text Kit
NSTextStorage;
NSLayoutManager;
NSTextContainer;
NSAttributedString

- Asset Catalog

- 持续集成

### 2 新的UI范式
- UIDynamicAnimator
任何遵从`UIDynamicItem`协议的对象都可以添加行为。UIView及其子类（包括UIControl）遵从这个协议，这意味着屏幕上可见的任何东西几乎都可以关联一种行为。
`UICollectionViewLayoutAttributes`也遵从`UIDynamicItem`协议，集合视图的元素有动力学行为。

- UIMotionEffect
CAAnimation 会对其所属的层做动画，UIMotionEffect会对其所属的视图做动画。
**CAAnimation的动画是时间的函数，UIMotionEffect的动画则是设备动作的函数。**

- 着色 tintColor

- 用半透明实现层次和上下文

- 动态字体

- 自定义过渡效果

两种自定义过渡：自定义视图控制器过渡和交互式视图控制器过渡。


### 3 你可能不知道的

- NSCache

- NSURLComponents

- CFStringTransform

- instancetype

- Base64和百分号编码

### 4 storyboard


### 5 UICollectionViewController


### 6 自动布局


### 7 更完善的自定义绘图


#### iOS的不同绘图系统

- UIKit

- Core Graphics(也称 Quartz 2D)  UIKit下的主要绘图系统

- Core Animation 提供强大的2D与3D动画服务

- Core Image 提供非常快的图片过滤方式，比如切图
锐化、扭曲和其他你能想象的变形效果

- OpenGL ES  主要用来编写高性能游戏（尤其是3D游戏），OpenGL ES是OpenGL绘图语言的子集，在多个平台可兼容。


#### UIKit和视图绘图周期


#### 视图绘制与视图布局


#### 自定义视图绘制


#### 优化UIView绘制

- 避免绘图

- 缓存与后台绘制

- 透明、不透明与隐藏


### 8 Core Animation


### 9 多任务


### 10 创建（Core） Foundation框架

### 11 后退处理


### 12 使用REST服务



#### 12.9 数据模型缓存


### 13 充分利用蓝牙设备




### 14 通过安全服务巩固系统安全



#### 保证网络通信的安全

证书工作原理



#### 使用文件保护

PIN


#### 使用钥匙串


#### 使用加密


- AES



### 15 在多个苹果平台和设备及64位体系结构上运行应用


#### 检测设备的功能


### 16 国际化和本地化


### 17 调试


#### 不同的崩溃类型

- EXC_BAD_ACCESS


- SIGSEGV

- SIGBUS

- SIGTRAP

- EXC_ARITHMETIC

- SIGILL

- SIGABRT


#### 收集崩溃报告


### 18 性能调优


#### Instruments




### 19 近乎物理效果： UIKit动力学



### 20 魔幻的自定义过渡



### 21 精妙的文本布局


### 22 键值编码和观察


### 23 GCD高级功能


### 深度解析Objective-C


