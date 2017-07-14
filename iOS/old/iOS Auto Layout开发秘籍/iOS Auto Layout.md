Auto Layout
-----------
### 一些基本知识
- UIKit和Auto Layout使用的坐标系的原点位于左上角


### 1 Auto Layout 介绍
frame spring strut Autosizing 
边界情况(edge case) 视图之间的相互关系

- Cassowary 
用户界面中生来就会出现不等关系和相等关系。  
通过 IB 和 代码 提供规则
- Auto Layout 的好处 
    + 与分辨率无关
    + 工作原理：通过创建屏幕上的对象之间的关系来实现布局
    + 几何关系  
        * 约束的变化可以制作成动画
    + 内容驱动的布局
    + 优先级规则
    + 检查和模块化
    + 与Autosizing兼容 
- 约束
    + `NSLayoutConstraint`
    + 界面的约束描述了视图的布局方式，使之能够动态地适配任何屏幕或者窗口几何形状
    + 可满足性（有效性）
        单独使用和作为整体使用时都有意义
    + 充分性   
        一个充分的(即**无歧义的**)布局在每个坐标轴上至少有两个几何规则
- 约束属性
    `NSLayoutRelationLessThanOrEqual`

- 1.9 图像装饰元素 

// 下次开始
### 2 约束
    
