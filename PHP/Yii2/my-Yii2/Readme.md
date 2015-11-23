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
	1. 