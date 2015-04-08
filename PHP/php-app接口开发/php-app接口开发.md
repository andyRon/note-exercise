- 客户端界面， 数据（http请求，通信接口）
- APP（通信）接口定义
接口地址
接口文件
接口数据（返回给客户端）
地址封装在app中得
- XML
节点可以自定义，html节点是固有
- json_encode() 只接受utf-8字符 否则返回null
$data = “”;
iconv(‘UTF-8’,’GBK’);
- 通信数据标准格式
code	状态吗(200,400等)
message	提示信息
data		返回数据
- XML方式封装通信接口
	+ 组装成字符串
	
			header("Content-Type:text/xml");
			$xml = "<?xml version='1.0' encoding='UTF-8'?>";
			$xml .= "<root>";
			
			$xml .= 
			
			$xml .= "</root>";
	+ xml节点不能为数字

### 核心技术
- 静态缓存
	+ PHP操作缓存
		* 生成缓存
		* 获取缓存
		* 删除缓存
- Memcache, Redis
	1. 用来管理数据的
	2. 数据存放在内存
	3. Redis可定期将数据备份到磁盘
	4. Memcache只支持key/value数据形式
	5. Redis支持很多类型的数据类型 string set list hash 
- php操作Redis
	+ 安装phpredis扩展
- 定时任务
	+ 定时任务命令
### APP接口实例
- 单例模式链接数据库
	+ 单例模式三大原则
		1. 构造函数需要标记为非public（防止外部使用new操作符创建对象），单例类不能在其他类中实例化，只能被其自身实例化；
		2. 拥有一个保存类的实例的静态成员变量$_instance;
		3. 拥有一个访问这个实例的公共的静态方法
- 首页app接口
	1. 直接数据库
		- 流程	HTTP请求 服务器 查询数据 返回数据
		- Start Bluestack 安卓模拟器
		- 链接数据库失败抛出异常，不要返回不必要的信息给客户端
	2. 读取缓存方式开发首页接口
		- 静态缓存如何设置缓存失效时间：把缓存时间写入缓存时间中然后读取时判断
	3. 定时读取缓存方式开发首页接口
		- 服务器如何提前准备数据
	4. APP版本升级以及APP演示
		- APP更新是用户自己操作的，web升级是工程师操作
		- 初始化接口	app_id(客户端，安卓)	version_id
			+ version_upgrade 版本升级信息表
			+ app表	客户端表
		-  版本升级接口开发
			+ http   app基本参数
			+ 接口传递参数  app_id	version_id	did（客户端设备号）	version_mini	encrypt_did(加密后的did串)
			+ 基本参数传递方式和获取方式
				* get	$_GET
				* post	$_POST
				* header头	$_SERVER(包含了诸如头信息、路径、脚本位置等信息)
			+ 通过表单来测试post接口
			+ 与客户端交互式都通过信息来显示
		- APP错误日志接口
				
