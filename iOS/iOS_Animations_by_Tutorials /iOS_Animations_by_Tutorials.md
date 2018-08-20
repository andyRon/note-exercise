[iOS Animations by Tutorials](https://store.raywenderlich.com/products/ios-animations-by-tutorials)
--------



## Section I: View Animations

### Chapter 1: Getting Started with View Animations

![1]()
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
	![2]()

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

     ![3]()

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


![4]()

### Chapter 4: View Animations in Practice



   

