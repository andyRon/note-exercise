## 安装nodejs（win7)
- 下载	[node-v0.10.35-x64.msi](http://nodejs.org/download/)
- 安装nodejs
	* 自定义安装在D:\dev\nodejs下面
	* 改变环境变量 PATH
	* cmd测试 `node -v` `npm -v`(新版nodejs已集成npm)
	* `npm config ls` 查看配置
	* `npm comfig set prefix "d:\dev\nodejs"` 修改prefix
- 安装相关环境
	npm install express -g 
	npm install jade -g
	npm install mysql -g
## just start
- Node.js事实上就是另外一种上下文。
- Node.js事实上既是一个运行时环境，同时又是一个库