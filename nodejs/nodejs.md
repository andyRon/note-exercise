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
## web应用不同模块分析
- HTTP服务器
- 路由
- **请求处理程序（request handler）**
- **请求数据处理功能**
- **试图逻辑**	数据内容展示
- **上传处理功能**
## start
- 大部分服务器都会在你访问 http://localhost:8888 /时尝试读取 http://localhost:8888/favicon.ico
- 服务端模块	server2.js
- 进行请求的*路由*：查看HTTP请求，从中提取出请求的URL以及GET/POST参数。这些数据堵在request对象中  
![](img/url.jpg)



- 模块
# 再次学习
### [2](https://nqdeng.github.io/7-days-nodejs/#1)  
- 运行
    + `node` 直接进入命令交互模式
    ```
    $ node
    > console.log('Hello World!');
    ```
    + `node hello.js`运行js文件
- 权限问题
    + 在Linux系统下，使用NodeJS监听80或443端口提供HTTP(S)服务时需要root权限
        * `sudo node server.js`
        * 使用chmod +s命令让NodeJS总是以root权限运行(让任何JS脚本都有了root权限，不安全)
        ```
        $ sudo chown root /usr/local/bin/node
        $ sudo chmod +s /usr/local/bin/node
        ```
- 模块
    + 每一个JS文件就是一个模块，而文件路径就是模块名。
    + 在编写每个模块时，都有require、exports、module三个预先定义好的变量可供使用。
    + `require`
        * 函数用于在当前模块中加载和使用别的模块，传入一个模块名，返回一个模块导出对象。模块名可使用相对路径（以./开头），或者是绝对路径（以/或C:之类的盘符开头）。
        * 模块名中的.js扩展名可以省略。
        * 加载使用一个JSON文件
        ```
        var h = require('./hello')
        h.hello()

        var man = require('./data.json')
        console.log(man.name)
        ```
    + `exports` 对象是当前模块的导出对象，用于导出模块公有方法和属性。别的模块通过require函数使用当前模块时得到的就是当前模块的exports对象.
    ```
    exports.hello = function () {
        console.log('Hello nodejs!');
    };
    ```
    + 模块初始化
    + 主模块



[1](http://www.runoob.com/nodejs/nodejs-tutorial.html)  
[3](http://www.nodebeginner.org/index-zh-cn.html)





----------

### npm的使用 
    - 安装包
        npm install express          # 本地安装
        npm install express -g   # 全局安装

        + 本地安装
            1. 将安装包放在 ./node_modules 下（运行 npm 命令时所在的目录），如果没有 node_modules 目录，会在当前执行 npm 命令的目录下生成 node_modules 目录。
            2. 可以通过 require() 来引入本地安装的包。
        + 全局安装
            1. 将安装包放在 /usr/local 下或者你 node 的安装目录。  /usr/local/lib/node_modules/npm
            2. 可以直接在命令行里使用。
    - 查看安装的包

        + npm ls -g
        + npm ls 
    - 卸载模块
        + npm uninstall express
    - 更新模块
        + npm update express

    - 搜索模块(第一次有点慢)
        + npm search express


    - registry
        npm update 命令怎么知道模块是否有最新版呢？ 向 https://registry.npmjs.org/ 查询
        查看react版本信息 https://registry.npmjs.org/react    https://registry.npmjs.org/react/v0.14.6 
        或者 `npm view react`  
        - 结果中 dist.tarball 是该版本压缩包的网址， npm install和npm update都是通过这中方式安装模块

    - 缓存目录


    http://www.ruanyifeng.com/blog/2016/01/npm-install.html
