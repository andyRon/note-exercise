## 目的

重头开始写yii2，只是为了学习和练习  
一步一步还原yii2

## 流程

### 连接
1. `vendor/yiisoft/yii2` yii2本身的源码所在
2. `frontend`	某一个应用   
   `frontend/web/index` 应用的入口文件  
3. 类自动加载机制
	
	    require(__DIR__."/../../vendor/autoload.php");
		require(__DIR__."/../../vendor/yiisoft/yii2/Yii.php");

	- 命名空间只是一个名字，一个类似于目录结构的的字符串,如：`yii\helpers\ArrayHelper`
	- ?? composer
	- Yii.php  BaseYii.php  classes.php

4. base
	1. Object.php   
		+ 实现[属性](http://www.digpage.com/property.html)：
			- 继承自 yii\base\Object 。
			- 声明一个用于保存该属性的私有成员变量。
			- 提供getter或setter函数，或两者都提供，用于访问、修改上面提到的私有成员变量。 如果只提供了getter，那么该属性为只读属性，只提供了setter，则为只写。 
		+ 一般而言，成员变量对外不可见是比较好的编程习惯。
		+ 由于 __get() __set() 都是public的， 无论将 getTitle() setTitle() 声明为 public, private, protected， 都没有意义，外部同样都是可以访问。所以，所有的属性都是public的。
		+ 由于 __get() __set() 都不是static的，因此，没有办法使用static 的属性。
	2. *Exception.php exception 相关的类
	3. Component.php
		+ Component由于增加了event和behavior这两个特性,牺牲了一些效率
		+ 关于 [行为](http://www.digpage.com/behavior.html)
			- 使用行为（behavior）可以在不修改现有类的情况下，对类的功能进行扩充。 通过将行为绑定到一个类，可以使类具有行为本身所定义的属性和方法，就好像类本来就有这些属性和方法一样。 而且不需要写一个新的类去继承或包含现有类。
			- Behavior只能与Component相关类绑定