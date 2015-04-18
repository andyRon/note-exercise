### php性能优化初探
1. 遇到什么样的PHP性能问题？
	- PHP语法使用的不恰当
	- 使用PHP语言做了它**不擅长**做的事
	- 用PHP语言链接的服务不给力
	- PHP自身的短板
	- 不知道的问题
2. PHP的性能问题的解决方向 
	- PHP语言级的性能优化 ->	PHP周边问题的性能优化（链接方面） -> PHP语言自身分析、优化（C语言）
3. php语言级的性能优化
	- ab测试工具
		+ `ab -n1000 -c100 http://www.baidu.com`
		+ Requests per second(每秒的接受的请求数) , Time per request(每个请求的耗时) ,
	- 少写代码，多用PHP自身功能
	- php代码运行流程  
		1. `*.php`通过zend逐行扫描生成zend自己能识别的语法
		2. 解析成Opcode（PHP的缓冲服务都是缓存Opcode）
		3. 执行Opcode，输出
	- PHP内置函数的性能优劣
		+ 多去了解PHP内置函数的时间复杂度
		+ isset()	array_key_exists()
	- 尽可能少用魔术函数
		+ `time php test_magic.php`
	- 优化 产生额外开销的错误抑制符@(少用)
		+ @的实际逻辑：在代码开始前、结束后，增加Opcode，忽略错误
		+ vld - PHP Opcode查看扩展 (The Vulcan Logic Dumper hooks into the Zend Engine and dumps all the opcodes (execution units) of a script. )
			* `curl -o vld-0.13.0.tgz http://pecl.php.net/get/vld-0.13.0.tgz` 代替 `wget http://pecl.php.net/get/vld-0.13.0.tgz`
			* `/usr/bin/phpize` 是用来扩展php扩展模块的
	- 合理使用内存
		+ 利用unset()及时释放不使用的内存(unset有时释放不掉变量？？)
	- php中得正则是双刃剑
	- 避免在循环内做运算
	- 减少计算密集型业务
		+ php语言特性决定了php不合适做大数据量运算（相对于C）
		+ PHP适合衔接webserver与后端服务、UI呈现
	- 务必使用带引号字符串做键值
		+ PHP会将没有引号的键值当作常量，产生额外的开销
4. php周边问题的性能优化
	- Linux 磁盘(文件存储) 数据库 内存(redis memcahce)  网络（分布式 时就要考虑网络）
	- DB.php ~  网络 + DB
	- 减少文件类操作
		+ 常见PHP场景的开销次序： 读写内存 << 读写数据库(磁盘+内存) < 读写磁盘 < 读写网络数据  