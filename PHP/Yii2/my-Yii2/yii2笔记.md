-----
[深入yii2](http://www.digpage.com/index.html)
-----

### 属性

1. **成员变量**  **属性**(yii\base\Object提供，就是通过__get,__set魔术方法)

	- 成员变量是一个“内”概念，反映的是类的结构构成。属性是一个“外”概念，反映的是类的逻辑意义。
	- 成员变量没有读写权限控制，而属性可以指定为只读或只写，或可读可写。
	- 成员变量不对读出作任何后处理，不对写入作任何预处理，而属性则可以。
	- public成员变量可以视为一个可读可写、没有任何预处理或后处理的属性。 而private成员变量由于外部不可见，与属性“外”的特性不相符，所以不能视为属性。
	- 虽然大多数情况下，属性会由某个或某些成员变量来表示，但属性与成员变量没有必然的对应关系
2. 属性的实现
	- 继承自 yii\base\Object
	- 声明一个私有成员变量
	- 提供getter和setter
	
3. 为啥是私有变量

### 事件、行为（yii\base\Component提供）