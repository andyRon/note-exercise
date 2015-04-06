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
### APP接口
- 单例模式
