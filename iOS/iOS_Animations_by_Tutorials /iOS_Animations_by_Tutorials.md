[iOS Animations by Tutorials](https://store.raywenderlich.com/products/ios-animations-by-tutorials)
--------



## Section I: View Animations

### Chapter 1: Getting Started with View Animations



![](https://ws2.sinaimg.cn/large/006tNbRwgy1fw6k7jrgdmg30900fuwhz.gif)

- Animatable properties
  * Position and size
  `bounds`  `frame` `center`
  * Appearance  
  `backgroundColor`  `alpha`
  * Transformation  
  `transform`

- Animation options
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

- 添加云的动画
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


### Chapter 2: Springs

- Spring animations

`animate(withDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion) `

`usingSpringWithDamping` 阻尼参数 0.0 ~ 1.0 ,  1.0看上去很僵硬(回弹效果不明显,bounce)，可以理解回弹的幅度 
`initialSpringVelocity`  初始速率， 可以理解回弹的速率

- Animating user interactions


### Chapter 3: Transitions  过渡动画

`transition(with:duration: options:animations:completion:) `

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









