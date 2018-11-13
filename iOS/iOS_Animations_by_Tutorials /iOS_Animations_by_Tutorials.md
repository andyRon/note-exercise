[iOS Animations by Tutorials](https://store.raywenderlich.com/products/ios-animations-by-tutorials)
--------



## Introduction

When  used properly, animations can convey information to your users and draw their attention to important parts of the interface.





## Section I: View Animations

introduce you to the animation API of UIKit.This API is specifically designed to help you animate your views with ease while avoiding the complexity of Core Animation, which runs the animations under the hood.



### Chapter 1: Getting Started with View Animations

最终效果

![](https://ws2.sinaimg.cn/large/006tNbRwgy1fw6k7jrgdmg30900fuwhz.gif)

#### 开始

- 开始创建一个静的登录页面，有两个TextField，一个Label，一个Button，4个云图片和一个背景图片

- 在`viewWillAppear()`中添加，如下代码，让heading和两个TextField开始时在屏幕外:

  ```swift
          heading.center.x    -=  view.bounds.width
          username.center.x   -=  view.bounds.width
          password.center.x   -=  view.bounds.width
  ```
![](https://ws4.sinaimg.cn/large/006tNbRwgy1fw8zt5x34nj30cm05na9x.jpg)

- 添加heading和两个TextField进入屏幕动画

```swift
UIView.animate(withDuration: 0.5) {
	self.heading.center.x += self.view.bounds.width
}

UIView.animate(withDuration: 0.5, delay: 0.3, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.0, options: [], animations: {
            self.username.center.x += self.view.bounds.width
        }, completion: nil)

UIView.animate(withDuration: 1, delay: 0.6, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.0, options: [], animations: {
            self.password.center.x += self.view.bounds.width
        }, completion: nil)

```

  

`completion`:  some final cleanup tasks or chain animations one after the other.



#### Animatable properties

* Position and size
  `bounds`  `frame` `center`
* Appearance  
  `backgroundColor`  `alpha`
* Transformation  
  `transform`





#### Animation options
`UIViewAnimationOptions`



* Repeating  

`repeat`  `autoreverse`

![](https://ws4.sinaimg.cn/large/006tNbRwgy1fw6k7ynuqlg30k40ga0ut.gif)

* Animation easing  

`.curveLinear`  
`.curveEaseIn`	  动画开始时加速

```
UIView.animate(withDuration: 1, delay: 0.6, options: [.repeat, .autoreverse, .curveEaseIn], animations: {
          self.password.center.x += self.view.bounds.width
      }, completion: nil)
```

`.curveEaseOut`   动画结束之前减速 

```
UIView.animate(withDuration: 1, delay: 0.6, options: [.repeat, .autoreverse, .curveEaseOut], animations: {
          self.password.center.x += self.view.bounds.width
      }, completion: nil)
```

   

![](https://ws3.sinaimg.cn/large/006tNbRwgy1fw6k8dv4rhg30k40gago8.gif)





  `.curveEaseInOut`  动画开始时加速结束时减速

- 添加云的渐变动画
```
cloud1.alpha = 0.0
cloud2.alpha = 0.0
cloud3.alpha = 0.0
cloud4.alpha = 0.0
```

```
UIView.animate(withDuration: 0.5, delay: 0.5, options: [], animations: {
            self.cloud1.alpha = 1.0
        }, completion: nil)
UIView.animate(withDuration: 0.5, delay: 0.7, options: [], animations: {
    self.cloud2.alpha = 1.0
}, completion: nil)
UIView.animate(withDuration: 0.5, delay: 0.9, options: [], animations: {
    self.cloud3.alpha = 1.0
}, completion: nil)
UIView.animate(withDuration: 0.5, delay: 1.1, options: [], animations: {
    self.cloud4.alpha = 1.0
}, completion: nil)
```

### Chapter 2: Springs（弹簧动画）



![](https://ws3.sinaimg.cn/large/006tNbRwgy1fw90biqpzjj306x057a9x.jpg)

用点变化描述弹簧动画：

![](https://ws1.sinaimg.cn/large/006tNbRwgy1fw90cubqxvj307u04smx2.jpg)





#### Spring animations

`animate(withDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion) `

`usingSpringWithDamping` 阻尼参数 0.0 ~ 1.0 ,  1.0看上去很僵硬(回弹效果不明显,bounce)，可以理解回弹的幅度 
`initialSpringVelocity`  初始速率， 可以理解回弹的速率



#### Animating user interactions

。。。



### Chapter 3: Transitions  过渡动画



**Transitions** are predefined animations you can apply to views. 

`transition(with:duration: options:animations:completion:) `



#### 过渡动画的例子



预定义过渡动画的选项：

```
.transitionFlipFromLeft
.transitionFlipFromRight
.transitionCurlUp
.transitionCurlDown
.transitionCrossDissolve
.transitionFlipFromTop
.transitionFlipFromBottom
```



#### 组合过渡动画



**Debug/Toggle Slow Animations**   方便调试


![整体效果](https://ws1.sinaimg.cn/large/006tNbRwgy1fw6f5gckt8g30900fytpt.gif)





### Chapter 4: View Animations in Practice

`CAEmitterCell`

Crossfade Animation  			同时淡出淡入
Cube transition animation  		立体转换
Fade and bounce transition





#### Crossfading animations

- `UIView.AnimationOptions`:  
- `UIView.KeyframeAnimationOptions`



#### Cube transitions

![](https://ws2.sinaimg.cn/large/006tNbRwgy1fw6g60qxyuj30oe06mgmf.jpg)

假装3d转换时文字背景颜色



faux-perspective effect(远景的效果)：

![](https://ws1.sinaimg.cn/large/006tNbRwgy1fw6jejb346j30ew04wmx3.jpg)



#### Fade and bounce transitions





#### 缺少 Challenges





### Chapter 5：Keyframe Animations

如果要实现如下效果：
![](https://ws2.sinaimg.cn/large/006tNbRwgy1fw6pom0519j30ai05kgll.jpg)

大概代码：

```swift
UIView.animate(withDuration: 0.5, 
  animations: {
    view.center.x += 200.0
  }, 
  completion: { _ in
    UIView.animate(withDuration: 0.5, 
      animations: {
        view.center.y += 100.0
      }, 
      completion: { _ in
        UIView.animate(withDuration: 0.5, 
          animations: {
            view.center.x -= 200.0
          }, 
          completion: { _ in
            UIView.animate(withDuration: 0.5, 
              animations: {
                view.center.y -= 100.0
              }
            )
          }
        )
      }
    )
  }
)
​```
```



使用Keyframe Animations就可以代替上面繁琐的嵌套动画



#### Keyframe Animations

![image-20181013172100870](/Users/andyron/Library/Application Support/typora-user-images/image-20181013172100870.png)

让飞机✈️有四个不同阶段的动画：

1. 直接跑到加速飞行
2. 一点向上倾斜飞行
3. 比较大向上倾斜加速飞行
4. 最后10%时飞机渐渐淡出视图



效果就是每次切换航班时，飞机都重新飞一圈，如下图：

![](https://ws2.sinaimg.cn/large/006tNbRwgy1fw6q1i7cigj30ef04jweh.jpg)







The options for keyframes are different; they come from the `UIViewKeyFrameAnimationOptions` enumeration instead of `UIViewAnimationOptions`. 



第一步的时间和相对值占比

![](https://ws3.sinaimg.cn/large/006tNbRwgy1fw6qeea0w6j30ep04ra9y.jpg)



第二步的时间：

![](https://ws2.sinaimg.cn/large/006tNbRwgy1fw6qmmpyn4j30ea04eglj.jpg)



#### 关键帧动画中的计算模式



关键帧动画不支持标准视图动画中可用的内置缓动曲线。 这是设计的; 关键帧应该在特定时间开始和结束并相互流动。

如果上面动画的每个阶段都有一个缓动曲线，那么飞机就会抖动，而不是从一个动画平稳地移动到下一个动画。 如果你可以对整个动画应用缓动，那么会导致你的动画持续时间被忽略 - 这不是你想要的。
相反，您有几种计算模式可供选择; 每种模式提供了一种不同的方法来计算动画的中间帧以及不同的优化器，以实现平滑移动甚至起搏。 有关更多详细信息，请通过搜索UIViewKeyframeAnimationOptions来查看文档。

现在您已经知道如何使用关键帧动画将任意数量的简单动画组合在一起，您可以构建几乎任何想到的序列。 如果您想测试关键帧和关键帧动画的知识，请先尝试下面的挑战，然后再继续下一部分。



#### 航班出发时间动画





## Sction II: Auto Layout



**Packing List**



### Chapter 6: Intorduction to Auto Layout 



Once you place your app in the hands of Auto Layout, you no longer set the bounds, frame or center properties of a view. If you were to try, UIKit will force a layout pass on your UI using Auto Layout, which will set everything back to the positions and sizes determined by your constraints.



##### 创建项目Packing List

- 添加一个UIView当作navigation bar，高度为60，背景色选择**Group Table View Background Color **；添加一个UILabel作为title，添加一个UIButton。
- 添加一个UITableView和一个UITableViewCell
- 





### Chapter 7: Animating Constraints

Animating constraints is no more difficult than animating properties; it’s just a little different. 

`NSLayoutConstraint`



#### Animating layout changes

 By calling `layoutIfNeeded()` from within the animation closure, you set the center and bounds of every view involved in the layout. 



#### Rotating view animations



#### Insecting and animating constraints

有时不能通过IB来实现outlets之间的约束，不想使用**Control-drag**方式添加大量的约束outlets。

`UIView`提供了`constraints`属性，a list of all constraints that affect the given view.



```swift
        titleLabel.superview?.constraints.forEach { constraint in
            print("-> \(constraint.description)\n")
        }
```



打印结果：

```swift
-> <NSLayoutConstraint:0x600002d04320 UIView:0x7ff7df530c00.height == 200   (active)>

-> <NSLayoutConstraint:0x600002d02210 UILabel:0x7ff7df525350'Select Item'.centerX == UIView:0x7ff7df530c00.centerX   (active)>

-> <NSLayoutConstraint:0x600002d02a30 UILabel:0x7ff7df525350'Select Item'.centerY == UIView:0x7ff7df530c00.centerY + 5   (active)>

-> <NSLayoutConstraint:0x600002d02d00 H:[UIButton:0x7ff7df715d20'+']-(8)-|   (active, names: '|':UIView:0x7ff7df530c00 )>

-> <NSLayoutConstraint:0x600002d030c0 UIButton:0x7ff7df715d20'+'.centerY == UILabel:0x7ff7df525350'Select Item'.centerY   (active)>
```

五个约束对应

![](https://ws3.sinaimg.cn/large/006tNbRwgy1fw8o6ki0mtj30lm0g6q37.jpg)



#### Animating UILabel constraints

 `NSLayoutConstraint` properties map 

![](https://ws1.sinaimg.cn/large/006tNbRwgy1fw8oc6w8ynj30eq053t8s.jpg)

![](https://ws4.sinaimg.cn/large/006tNbRwgy1fw8ok05sq2g308q0frafs.gif)



#### 替代约束 

给约束添加 `Identifier`



![image-20181015101142175](/Users/andyron/Library/Application Support/typora-user-images/image-20181015101142175.png)



#### Adding constraints programmatically



![image-20181015101900852](/Users/andyron/Library/Application Support/typora-user-images/image-20181015101900852.png)



```
Title.CenterY = Menu.CenterY * 0.67 + 0.0
```



![](https://ws4.sinaimg.cn/large/006tNbRwgy1fw8p3arxskg308s0fntcl.gif)



#### Adding menu content



![](https://ws4.sinaimg.cn/large/006tNbRwgy1fw8pe0psf2g308s0fn4lk.gif)

#### Animating dynamically created views

`NSLayoutAnchor`



![](https://ws1.sinaimg.cn/large/006tNbRwgy1fw8pr61md8j308s0fr747.jpg)







![](https://ws3.sinaimg.cn/large/006tNbRwgy1fw8pwyg73og308s0fnjw3.gif)





在动画前添加

```swift
view.layoutIfNeeded()
```



![](https://ws1.sinaimg.cn/large/006tNbRwgy1fw8q0dbfjcg308s0fndid.gif)



#### 去除

```swift
UIView.animate(withDuration: 0.8, delay: 1.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.0, animations: {
            conBottom.constant = imageView.frame.size.height
            conWidth.constant = -50.0
            self.view.layoutIfNeeded()
        }) { (_) in
            imageView.removeFromSuperview()
        }
```



![](https://ws1.sinaimg.cn/large/006tNbRwgy1fw8qbtmmeag308s0fnafk.gif)





## Section III: Layer Animations

由于以下原因，图层与视图（相对于动画）不同：

- 图层是一个模型对象 - 它公开数据属性并且不实现任何逻辑。 它没有复杂的自动布局依赖关系，也没有处理用户交互。
- 它具有预定义的可见特征 - 这些特征是许多影响内容在屏幕上呈现的数据属性，例如边框线，边框颜色，位置和阴影。
- 最后，Core Animation优化了图层内容的缓存并直接在GPU上快速绘图。



视图：

- 复杂视图层次结构布局，自动布局等
- 用户互动。
- 通常具有在CPU上的主线程上执行的自定义逻辑或自定义绘图代码。
- 非常灵活，功能强大，子类很多类。



图层：

- 更简单的层次结构，更快地解决布局，绘制速度更快。
- 没有响应者链开销。
- 默认情况下没有自定义逻辑 并直接在GPU上绘制。
- 不那么灵活，子类的类更少。



视图和图层的选择技巧：

任何时候你都可以选择视图动画; 当您将知道何时需要更高的性能或灵活性，而不得不转而使用图层动画。

### Chapter 8: Getting Started with Layer Animations 



#### Animatable properties



- Postion and size 

![](https://ws2.sinaimg.cn/large/006tNbRwgy1fw8y8bkr03j30do05qglq.jpg)



- Border

`borderColor`, `borderWidth`, `cornerRadius`





![image-20181015154228090](https://ws4.sinaimg.cn/large/006tNbRwgy1fw8ybp1rc8j30dx05o754.jpg)



- Shadow

  `shadowOffset`, `shadowOpacity`, `shadowPath`, `shadowRadius`

  ![image-20181015154548338](/Users/andyron/Library/Application Support/typora-user-images/image-20181015154548338.png)

- Contents

`contents`

`mask`    

`opacity`



#### 第一个Layer动画

- 删除之前的一些动画
- 添加`CABasicAnimation`

```swift
    let flyRight = CABasicAnimation(keyPath: "position.x")
    flyRight.fromValue = -view.bounds.size.width/2
    flyRight.toValue = view.bounds.size.width/2
    flyRight.duration = 0.5	
```



Animation objects in Core Animation are **simply data models**; you create an instance of the model and set its data properties accordingly.
An instance of CABasicAnimation describes **a potential layer animation**(之后可能运行也有可能不运行)

each layer will run a copy of the animation independently.

- 运行添加的核心动画对象

```swift
heading.layer.add(flyRight, forKey: nil)
```



#### More elaborate layer animations


```swift
    flyRight.beginTime = CACurrentMediaTime() + 0.3
    username.layer.add(flyRight, forKey: nil)
```



`CACurrentMediaTime` 是系统的一个绝对时间，机器开启时间，单位为s

`CACurrentMediaTime` 取自机器时间 `mach_absolute_time()`





- Using `fillMode`

The `fillMode` property lets you control the behavior of your animation at the beginning and end of its sequence.

`CAMediaTimingFillMode.both`  与`kCAFillModeBoth`的区别

`kCAFillModeRemoved`  

`kCAFillModeBackwards`  

`kCAFillModeForwards`  

`kCAFillModeBoth`  



#### Debugging basic animations

```swift
username.layer.position.x -= view.bounds.width
password.layer.position.x -= view.bounds.width
```

![](https://ws1.sinaimg.cn/large/006tNbRwgy1fw9uakzv3kg308s0fo0v1.gif)



![](https://ws2.sinaimg.cn/large/006tNbRwgy1fw9v6cjqdmj30xa0meacn.jpg)



![](https://ws3.sinaimg.cn/large/006tNbRwgy1fw9v6q3kc4j30uq0iadj0.jpg)






UI hierarchy 模式下可以查看当前runtime个UI布局情况，包括已经hidden或transparent和在屏幕外的视图。还可以3D查看。

![](https://ws1.sinaimg.cn/large/006tNbRwgy1fw9vjxwr0dg31140oz1hp.gif)



#### Animations vs. real content ??



**presentation layer**



```swift
    flyRight.isRemovedOnCompletion = false
```



- Updating the layer model



虽然你知道当设置为false时isRemovedOnCompletion是如何工作的，但尽可能避免使用它。 在屏幕上保留动画会影响性能，因此您可以自动删除它们并更新原始图层的位置。



#### Challenges



### Chapter 9: Animation Keys and Delegates



关于UIKit动画和相应的闭包语法的一个棘手部分是，一旦您创建并运行视图动画，您就无法暂停，停止或以任何方式访问它。

但是，使用Core Animation，您可以轻松检查在图层上运行的动画，并在需要时停止它们。 此外，您甚至可以在动画上设置委托对象并对动画事件做出反应。



#### 介绍animation delegates

![](https://ws1.sinaimg.cn/large/006tNbRwgy1fx4io22vm1j30de06qjre.jpg)



`CAAnimationDelegate`的两个代理方法：

```swift
func animationDidStart(_ anim: CAAnimation)
func animationDidStop(_ anim: CAAnimation, finished flag: Bool)
```

```swift
func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
    print(anim.description, "动画完成")
}
```



三个不同的layer

```swift
<CABasicAnimation: 0x6000032376e0> 动画完成
<CABasicAnimation: 0x600003237460> 动画完成
<CABasicAnimation: 0x600003237480> 动画完成
```



#### Key-value coding compliance

CAAnimation类及其子类是用Objective-C编写的，并且符合键值编码(KVO)，这意味着您可以将它们视为字典，并在运行时向它们添加新属性。
您将使用此机制为flyRight动画指定名称，以便您可以从其他活动动画中识别它。







#### Switching on key values

```swift
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        // print(anim.description, "动画完成")
        guard let name = anim.value(forKey: "name") as? String else {
            return
        }
    
        if name == "form" {
            // `value(forKey:)`的结果总是`Any`，因此需要转换为所需类型
            let layer = anim.value(forKey: "layer") as? CALayer
            anim.setValue(nil, forKey: "layer")
            // 简单的脉动动画
            let pulse = CABasicAnimation(keyPath: "transform.scale")
            pulse.fromValue = 1.25
            pulse.toValue = 1.0
            pulse.duration = 0.25
            layer?.add(pulse, forKey: nil)
        }
    }	
```



请注意，您在这里使用可选的链接层？ - 这意味着如果动画中没有存储图层，则会跳过add（_：forKey :)调用。 由于您将图层设置为nil，因此此脉冲动画仅在表单字段从右侧飞入时才会发生。



移动动画结束后有一个变大的动画效果：

![](https://ws2.sinaimg.cn/large/006tNbRwgy1fx4zbw6nt9g308q060q4l.gif)



这照顾已经停止的动画; 但是你如何使用仍在运行的动画呢？ 这就是**animation keys**的用武之地。



#### Animation Keys

在这部分中，您将创建另一个图层动画，学习如何一次运行多个动画，并了解如何使用Animation Keys控制正在运行的动画。





![](https://ws1.sinaimg.cn/large/006tNbRwgy1fx524dojubg308q0600vk.gif)



`animationKeys()`获得不到动画??



#### 完善云的动画



### Chapter 10: Groups and Advaced Timing

在上一章中，您学习了如何向单个图层添加多个独立动画。 但是，如果您希望您的动画同步工作并保持彼此一致，该怎么办？ 不必分别掌握所有动画的数学和时间，这没什么好玩的。 这就是**animation groups**进来的地方。

本章介绍如何使用`CAAnimationGroup`对动画进行分组，该动画允许您向组中添加多个动画并同时调整持续时间，委托和`timingFunction`等属性。
对动画进行分组会产生简化的代码，并确保您的所有动画将作为一个实体单元同步。



#### CAAnimationGroup

```swift
    let groupAnimation = CAAnimationGroup()
    groupAnimation.beginTime = CACurrentMediaTime() + 0.5
    groupAnimation.duration = 0.5
    groupAnimation.fillMode = kCAFillModeBackwards
    
    let scaleDown = CABasicAnimation(keyPath: "transform.scale")
    scaleDown.fromValue = 3.5
    scaleDown.toValue = 1.0
    
    let rotate = CABasicAnimation(keyPath: "transform.rotation")
    rotate.fromValue = .pi / 4.0
    rotate.toValue = 0.0
    
    let fade = CABasicAnimation(keyPath: "opacity")
    fade.fromValue = 0.0
    fade.toValue = 1.0
    
    groupAnimation.animations = [scaleDown, rotate, fade]
    loginButton.layer.add(groupAnimation, forKey: nil)
```





![](https://ws3.sinaimg.cn/large/006tNbRwgy1fx5fkh3qgjg308q0bjjwx.gif)





#### Animation easing 

对应Chapter1中的，层次动画中的easing在概念上是相同的 - 只有语法不同。

`CAMediaTimingFunction`   `CAMediaTimingFunction(controlPoints: _: _: _:)`





#### More timing options



这很容易看起来很酷，但你的动画还是有点不完美。 指令动画四次，但标签然后直接跳到屏幕的中心。
这是因为单个动画循环将标签移动到屏幕中心然后再次移出。 因此，当您运行动画四次时，最后一个循环以标签离开屏幕结束。 这就是标签似乎跳到屏幕中心的原因。 你不能跑半个动画周期 - 或者你可以吗？





只是为了好玩，你可以通过调整顶层视图控制器层的速度属性来使屏幕上的所有内容都超级快速地运行。



玩动画speeds, reversing and repeating很有趣，但你的用户可能不会喜欢这样的UI元素！
但如果您确实需要在本地调整动画速度，现在可以在动画级别以及整个图层上执行此操作。



#### 利用组动画修改三个form元素的动画



```swift
    let flyRight = CABasicAnimation(keyPath: "position.x")
    flyRight.fromValue = -view.bounds.size.width/2
    flyRight.toValue = view.bounds.size.width/2
    flyRight.duration = 0.5
    flyRight.fillMode = kCAFillModeBoth
    flyRight.delegate = self
    flyRight.setValue("form", forKey: "name")
    flyRight.setValue(heading.layer, forKey: "layer")
    
    heading.layer.add(flyRight, forKey: nil)
    
    flyRight.setValue(username.layer, forKey: "layer")
    
    flyRight.beginTime = CACurrentMediaTime() + 0.3
    username.layer.add(flyRight, forKey: nil)
    
    flyRight.setValue(password.layer, forKey: "layer")
    
    flyRight.beginTime = CACurrentMediaTime() + 0.4
    password.layer.add(flyRight, forKey: nil)
```

修改为：

```swift
    let formGroup = CAAnimationGroup()
    formGroup.duration = 0.5
    formGroup.fillMode = kCAFillModeBackwards
    
    let flyRight = CABasicAnimation(keyPath: "position.x")
    flyRight.fromValue = -view.bounds.size.width/2
    flyRight.toValue = view.bounds.size.width/2
    
    let fadeFieldIn = CABasicAnimation(keyPath: "opacity")
    fadeFieldIn.fromValue = 0.25
    fadeFieldIn.toValue = 1.0
    
    formGroup.animations = [flyRight, fadeFieldIn]
    heading.layer.add(formGroup, forKey: nil)
    
    formGroup.delegate = self
    formGroup.setValue("form", forKey: "name")
    formGroup.setValue(username.layer, forKey: "layer")
    
    formGroup.beginTime = CACurrentMediaTime() + 0.3
    username.layer.add(formGroup, forKey: nil)
    
    formGroup.setValue(password.layer, forKey: "layer")
    formGroup.beginTime = CACurrentMediaTime() + 0.4
    password.layer.add(formGroup, forKey: nil)
```





### Chapter 11: Layer Springs

UIKit的Layer Springs可以让你创建一个有点过于简单的弹簧式动画，但核心动画Layer Springs对应物会呈现一个看起来和感觉更自然的正确物理模拟。



#### Damped harmonic oscillators（阻尼谐振子，逐渐衰减的振动）

UIKit API简化了弹簧动画的制作; 你不需要了解他们如何在引擎盖下工作。 但是，由于您现在是核心动画专家，因此您需要深入研究细节。

钟摆。理想状况下钟摆是不停的摆动，像下面的一样：

![](https://ws2.sinaimg.cn/large/006tNbRwgy1fx5ndd6e2wj308106kaa0.jpg)

对应的运动轨迹图就像：

![](https://ws4.sinaimg.cn/large/006tNbRwgy1fx5ne165xmj30a5048wed.jpg)

但现实中由于能力的损耗，钟摆的摇摆的幅度在逐渐减小：

![image-20181112222946546](https://ws4.sinaimg.cn/large/006tNbRwgy1fx5nf8yf71j30a206saap.jpg)

![image-20181112223028487](https://ws3.sinaimg.cn/large/006tNbRwgy1fx5nfxvbhij30c204kt8s.jpg)



#### UIKit vs Core Animation springs

UIKit以动态方式调整所有其他变量，使系统在给定的持续时间内稳定下来。 这就是为什么UIKit弹簧动画有时感觉有点 - 好吧，被迫。 UIKit动画只是有点过于兴奋，而且训练有素的眼睛，有点不自然。



幸运的是，Core Animation允许您通过CASpringAnimation类为图层属性创建适当的弹簧动画。 `CASpringAnimation`在幕后为UIKit创建弹簧动画，但是当你直接调用它时，你可以设置系统的各种变量，让动画自行安定下来。 这种方法的缺点是你不能告诉动画它的持续时间应该是多少; 这取决于您提供的变量，由系统本身决定。

`damping`    阻尼系数，阻止弹簧伸缩的系数，阻尼系数越大，停止越快

`mass`   质量，影响图层运动时的弹簧惯性，质量越大，弹簧拉伸和压缩的幅度越大

`stiffness `    刚度系数(劲度系数/弹性系数)，刚度系数越大，形变产生的力就越大，运动越快

`initialVelocity`   初始速率，动画视图的初始速度大小
速率为正数时，速度方向与运动方向一致，速率为负数时，速度方向与运动方向相反



#### first layer spring animation

这个小缩放动画让用户知道该字段处于活动状态并可以使用。 然而，动画有些突然结束。 通过用适当的弹簧动画替换现有的动画，你可以让它看起来更漂亮。



把基础动画代码：

```swift
			// 简单的脉动动画
            let pulse = CABasicAnimation(keyPath: "transform.scale")
            pulse.fromValue = 1.25
            pulse.toValue = 1.0
            pulse.duration = 0.25
            layer?.add(pulse, forKey: nil)
```



转变为：

```swift
			let pulse = CASpringAnimation(keyPath: "transform.scale")
            pulse.damping = 2.0
            pulse.fromValue = 1.25
            pulse.toValue = 1.0
            pulse.duration = pulse.settlingDuration
            layer?.add(pulse, forKey: nil)
```

效果图对比：

![CABasicAnimation](https://ws2.sinaimg.cn/large/006tNbRwgy1fx4zbw6nt9g308q060q4l.gif)

![](https://ws2.sinaimg.cn/large/006tNbRwgy1fx647m132mg308o060464.gif)



这边要注意`duration`。要使用系统根据当前参数估算的弹簧动画从开始到结束的时间`pulse.settlingDuration`。

这是你的代码完全按照你的要求做的事情：

  您使用自定义阻尼值和所有其他系统变量的默认值创建了弹簧动画
  但你也通过设置其持续时间属性告诉它运行0.25秒。

弹簧系统不能在0.25秒内稳定下来; 你提供的变量意味着动画应该在它停止前运行几秒钟。
这是一个关于如何切断弹簧动画的视觉演示：

![](https://ws3.sinaimg.cn/large/006tNbRwgy1fx64fgnaecj30bw03sq2u.jpg)



`settlingDuration`是怎么计算的呢？！



`pulse.damping = 7.5`





- Spring animation propertiers



#### Specific layer properties



验证动画现在可能有点过于微妙和流畅。 您将在包含无效输入的文本字段周围添加一个不那么微妙的闪烁红色边框。



文本框颜色边的动画



#### Challenges??



### Chapter 12: Layer KeyFrame Animations and Struct Properties

Layer上的关键帧动画与UIView上的关键帧动画略有不同。 查看关键帧动画是将独立简单动画组合在一起的简单方法; 它们可以为不同的视图和属性设置动画，动画可以重叠或在两者之间存在间隙。
相比之下，`CAKeyframeAnimation`允许您为给定图层上的单个属性设置动画。 您可以定义动画的不同关键点，但动画中不能有任何间隙或重叠。 尽管起初听起来有些限制，但你可以使用CAKeyframeAnimation创建一些非常引人注目的效果。



![](https://ws1.sinaimg.cn/large/006tNbRwgy1fx690o3li9g308m060dho.gif)



眼睛敏锐的读者可能已经注意到我还没有介绍过结构属性的动画。 大多数情况下，你可以放弃动画结构的单个组件，例如CGPoint的x组件，或CATransformation3D的旋转组件，但是接下来你会发现动态结构值的动画比 你可能会先考虑一下。



#### Animating struct values

结构实例是Swift中的一等公民。 实际上，在使用类和结构之间语法上几乎没有区别。
但是，Core Animation是一个基于C构建的Objective-C框架，这意味着结构的处理方式截然不同。 Objective-C API喜欢处理对象，因此结构需要一些特殊的处理。
这就是为什么对图层属性（如颜色或数字）进行动画制作相对容易的原因，但是为CGPoint等结构属性设置动画并不容易。
CALayer有许多可动画的属性，它们包含struct值，包括CGPoint类型的位置，CATransform3D类型的转换和CGRect类型的边界。 为了帮助管理这个问题，Cocoa包含了NSValue类，它将一个struct值“包装”或“包装”为一个对象。





#### Intermediate keyframe animations

如果您需要在屏幕上显示图像但不需要使用UIView的所有好处（例如自动布局约束，附加手势识别器等），您可以简单地使用上面的代码示例中的CALayer。



![](https://ws3.sinaimg.cn/large/006tNbRwgy1fx69jdo8zrj30d606zglk.jpg)



![](https://ws1.sinaimg.cn/large/006tNbRwgy1fx69ltw09dg308s0avwtn.gif)



### Chapter 13: Shapes and Masks

本章标志着本书这一部分的一个转变：你不仅要开始使用不同的示例项目，而且还要使用多层效果，创建看起来与物理交互的图层动画。 彼此在动画运行时在形状之间变换。

`CAShapeLayer`



本章中的形状将由CAShapeLayer处理，这是一个CALayer子类，可以让您在屏幕上绘制各种形状，从非常简单到非常复杂：

您可以在屏幕上绘制CALayer CGPath，而不是接受绘图说明。 这很方便，因为Core Graphics已经为构建CGPath形状定义了非常广泛的绘图指令API。
如果您更熟悉UIBezierPath，可以使用它来定义形状，然后使用其cgPath属性来获取其Core Graphics表示。 你将在本章稍后再试一试。



#### 开始项目



#### avatar view

`photoLayer`：头像的图像层。
`circleLayer`：用于绘制圆的形状图层。
`maskLayer`：另一个用于绘制蒙版的形状图层。
`label`：显示玩家姓名的标签。



![](https://ws2.sinaimg.cn/large/006tNbRwgy1fx6ami0kayj30e405r74e.jpg)



#### Creating the bounce-off animation



![](https://ws1.sinaimg.cn/large/006tNbRwgy1fx6g7btqrug308s08u77g.gif)



#### Morphing shapes(变形图形)



![](https://ws1.sinaimg.cn/large/006tNbRwgy1fx6gl8vr2tg308s08uwhy.gif)



```swift
        maskLayer.add(morphAnimation, forKey: nil)
```



