// (function(window, undefined){
// 	var jQuery = function(){ undefined = 1;alert(undefined)}

// 	window.jQuery = window.$ = jQuery;
// })(window);

// var aQuery = function(selector, context) {
// 		return aQuery.prototype.init();
// }

// aQuery.prototype = {
// 	init:function(){
// 		return this;
// 	},
// 	name:function(){},
// 	age:function(){}
// }

// aQuery.prototype = {
// 	init: function(){
// 		return this;
// 	},
// 	name: function(){
// 		return this;
// 	}
// }

jQuery.fn.extend({
	setName:function(name){
		this.name = name;
		return this;
	},
	getName:function(){
		console.log(this.name);
	}
})