Grunt的使用
-----------------------------
[document](http://www.gruntjs.net/getting-started)
### 入门
1. install npm
2. `npm install -g grunt-cli`
3. 在项目根目录下手动创建 `package.json`  
   或者通过命令 `npm init` 按步骤创建  

		{
		  "name": "test-project",
		  "version": "0.1.0",
		  "description": "test",
		  "main": "index.js",
		  "scripts": {
		    "test": "test"
		  },
		  "keywords": [
		    "andyron"
		  ],
		  "author": "andyron",
		  "license": "ISC"
		}
4. `npm install grunt --save-dev`  将Grunt最新版本添加到项目中，做了两个动作：
	- 修改`package.json`,添加 `devDependencies` 
	
			"devDependencies": {
		    "grunt": "^0.4.5"
		  	}
	- 下载Grunt，在项目根目录中多了 `node_modules/grunt`文件夹
5. `npm install grunt-contrib-jshint --save-dev`  安装jshint
6. `Gruntfile.js` 包括：
	- "wrapper" 函数 
	
			module.exports = function(grunt) {
			  // Do grunt-related things in here
			};
	- 项目与任务配置
	- 加载grunt插件和任务
	- 自定义任务