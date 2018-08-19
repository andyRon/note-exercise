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


### 2 新的UI范式
- UIDynamicAnimator
任何遵从`UIDynamicItem`协议的对象都可以添加行为。UIView及其子类（包括UIControl）遵从这个协议，这意味着屏幕上可见的任何东西几乎都可以关联一种行为。
`UICollectionViewLayoutAttributes`也遵从`UIDynamicItem`协议，集合视图的元素有动力学行为。
- UIMotionEffect
CAAnimation 会对其所属的层做动画，UIMotionEffect会对其所属的视图做动画。
**CAAnimation的动画是时间的函数，UIMotionEffect的动画则是设备动作的函数。**

- 着色 tintColor

- 用半透明实现层次和上下文

### 3 你可能不知道的


