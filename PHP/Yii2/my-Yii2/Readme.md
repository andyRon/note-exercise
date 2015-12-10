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
			- 行为的绑定 
				* 绑定的动作从Component发起；
				* 静态绑定通过重载 yii\base\Componet::behaviors() 实现；
				* 动态绑定通过调用 yii\base\Component::attachBehaviors() 实现；
				* 行为还可以通过为 Component 配置 as 配置项进行绑定；
				* 行为有匿名行为和命名行为之分，区别在于绑定时是否给出命名。 命名行为可以通过其命名进行标识，从而有针对性地进行解除等操作；
				* 绑定过程中，后绑定的行为会取代已经绑定的同名行为；
				* 绑定的意义有两点，一是为行为设置 $owner 。二是将行为中拟响应的事件的handler绑定到类中去。
	4. event.php
	5. ?? yii\di\ServiceLocator   Service Locator模式非常贴合Web这种基于服务和组件的应用的运作特点. 优点：
		- Service Locator充当了一个运行时的链接器的角色，可以在运行时动态地修改一个类所要选用的服务， 而不必对类作任何的修改。
		- 一个类可以在运行时，有针对性地增减、替换所要用到的服务，从而得到一定程度的优化。
		- 实现服务提供方、服务使用方完全的解耦，便于独立测试和代码跨框架复用。
		- 当你第一次访问某组件时，yii\di\ServiceLocator 会通过该组件的注册信息创建一个该组件的实例，并返回它。
	6. ?? yii\di\Container
	7. yii\base\module
	8. yii\base\application


- 数据库