jQuery源码学习记录 
-------------------------
[艾伦](http://www.cnblogs.com/aaronjs/p/3278578.html)

### AMD
AMD是"Asynchronous Module Definition"的缩写，意思就是"异步模块定义"。

### 核心架构

3. 插接接口
	- jQuery.extend和jQuery.fn.extend其实是同指向同一方法的不同引用  
	`jQuery.extend = jQuery.fn.extend = function() {`,
	- 但通过this  
	jQuery.extend 对jQuery本身的属性和方法进行了扩展  
    jQuery.fn.extend 对jQuery.fn的属性和方法进行了扩展

4. 整体架构
	![](http://img.mukewang.com/53fa8fec0001754806930473.jpg)	

5. 立即调用表达式

		(function(window, undefined) {
		    var jQuery = function() {}
		    // ...
		    window.jQuery = window.$ = jQuery;
		})(window);
	
	- 任何库与框架设计的第一个要点就是解决命名空间与变量污染的问题。
	- [为什么要传递undefined？](http://www.imooc.com/code/3247)

6. jQuery的类数组对象结构
	- 通过对象get方法或者直接通过下标0索引就能转成DOM对象。
	- 这种使DOM成为“类数组对象”，就可以像对象一样处理，同时也能像数组一样可以使用push、pop、shift、unshift、sort、each、map等类数组的方法操作jQuery对象了。
7. jQuery中ready与load事件
	
		$(document).ready(function() {
		    // ...代码...
		})
		//document ready 简写
		$(function() {
		    // ...代码...
		})
		$(document).load(function() {
		    // ...代码...
		})

	- ready先执行，load后执行。
	- DOM文档加载的步骤：

			(1) 解析HTML结构。
			(2) 加载外部脚本和样式表文件。
			(3) 解析并执行脚本代码。
			(4) 构造HTML DOM模型。//ready
			(5) 加载图片等外部文件。
			(6) 页面加载完毕。//load

### 核心模块
1. 对象的构建
2. 分离构造器