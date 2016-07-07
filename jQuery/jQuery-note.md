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




2016-07-05 11:06:10
再次学习jQuery - How jQuery Works
-------------------
### about
- `window.onload = function(){}`  vs  `$(document).ready(function(){})`
- `event.preventDefault()`  prevent the default behavior .例如a链接的的跳转页面行为
- `$.get( "myhtmlpage.html", myCallBack );`    Access-Control-Allow-Origin
- [ HTTP访问控制(CORS)](https://developer.mozilla.org/zh-CN/docs/Web/HTTP/Access_control_CORS)

### using jQuery Core
- $ vs $()
- Avoiding Conflicts with Other Libraries
		
		var $j = jQuery.noConflict();
		// $j is now an alias to the jQuery function; creating the new alias is optional.
		$j(document).ready(function() {
		    $j( "div" ).hide();
		});


		jQuery.noConflict();
 
		jQuery( document ).ready(function( $ ) {
		    // You can use the locally-scoped $ in here as an alias to jQuery.
		    $( "div" ).hide();
		});


		// Use full jQuery function name to reference jQuery.
		jQuery( document ).ready(function() {
		    jQuery( "div" ).hide();
		});


		jQuery.noConflict();
 
		(function( $ ) {
		    // Your jQuery code here, using the $
		})( jQuery );


		jQuery(document).ready(function( $ ) {
		    // Your jQuery code here, using $ to refer to jQuery.
		});


		jQuery(function($){
		    // Your jQuery code here, using the $
		});

- `.attr()` 
	getter 获取所有元素中的第一个的属性  
	setter 设置所有元素的属性
- selecting elements
	+ 通过id
	+ 通过class
	+ 通过属性	`$( "input[name='first_name']" );`
	+ 通过混合css
	+ a Comma-separated List of Selectors	`$( "div.myClass, ul.people" );`
	+ Pseudo-Selectors 
		
			$( "a.external:first" );
			$( "tr:odd" );
			 
			// Select all input-like elements in a form (more on this below).
			$( "#myForm :input" );
			$( "div:visible" );
			 
			// All except the first three divs.
			$( "div:gt(2)" );
			 
			// All currently animated divs.
			$( "div:animated" );

	+ Choosing Selectors	
		* $( "div.foo" ).length
		* 筛选 
				
				// Refining selections.
				$( "div.foo" ).has( "p" );         // div.foo elements that contain <p> tags
				$( "h1" ).not( ".bar" );           // h1 elements that don't have a class of bar
				$( "ul li" ).filter( ".current" ); // unordered list items with class of current
				$( "ul li" ).first();              // just the first unordered list item
				$( "ul li" ).eq( 5 ); 

		* Selecting Form Elements
				
				:checked
				:disabled
				:enabled
				:input 
				:selected
				:password
				:reset
				:radio
				:text
				:submit
				:checkbox
				:button
				:image
				:file
- Manipulating Elements
	+ Getting and Setting Information About Elements  
		.html()  .text()  .attr()  .width()  .height()  .position()  .val()  
	+ link Moving, Copying, and Removing Elements
	+ Cloning Elements
	+ Removing Elements  
		* .remove()
		* .detach()
		* .empty()
	+ Creating New Elements
		
			// Creating a new element with an attribute object.
			$( "<a/>", {
			    html: "This is a <strong>new</strong> link",
			    "class": "new",
			    href: "foo.html"
			});  
	+ Manipulating Attributes
		
			// Manipulating a single attribute.
			$( "#myDiv a:first" ).attr( "href", "newDestination.html" );

			// Manipulating multiple attributes.
			$( "#myDiv a:first" ).attr({
			    href: "newDestination.html",
			    rel: "nofollow"
			});

			// Using a function to determine an attribute's new value.
			$( "#myDiv a:first" ).attr({
			    rel: "nofollow",
			    href: function( idx, href ) {
			        return "/new/" + href;
			    }
			});
			 
			$( "#myDiv a:first" ).attr( "href", function( idx, href ) {
			    return "/new/" + href;
			});
