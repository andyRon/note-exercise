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