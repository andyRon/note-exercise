//this的五种情况 [](http://bonsaiden.github.io/JavaScript-Garden/zh/#function.this)

// 1. 全局返回 指全局对象
// 2. 函数调用 指全局对象
function test() {
    return this;
}

console.log(test());  // Window


// 3. 方法调用 指调用此方法的对象

test2 = {
    a:function(){
        return this;
    }
}
console.log(test2.a());

// 4. 调用构造函数 新创建的对象


// 5. 显式的设置 this

function foo(a, b, c) {}

var bar = {};
foo.apply(bar, [1, 2, 3]); // 数组将会被扩展，如下所示
foo.call(bar, 1, 2, 3); // 传递到foo的参数是：a = 1, b = 2, c = 3
// 当使用 Function.prototype 上的 call 或者 apply 方法时，函数内的 this 将会被 显式设置为函数调用的第一个参数。

// 因此函数调用的规则在上例中已经不适用了，在foo 函数内 this 被设置成了 bar。