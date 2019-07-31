https://angular.io/docs/ts/latest/
-----------

### GUIDE
- Architecture
    + Angular is a framework for building client applications in HTML and either JavaScript or a language like TypeScript that compiles to JavaScript.
    + 结构图
    !()[https://angular.io/resources/images/devguide/architecture/overview2.png]
        * Modules
            - *the root module* `AppModule`
        * Components
        * Templates
        * Metadata
        * Data binding
        * Driectives
        * Services
        * Dependency injection






[AngularJS 教程](http://www.runoob.com/angularjs/angularjs-tutorial.html)
------
### 1 AngularJS 简介
- 以一个 JavaScript 文件形式发布的
- AngularJS 通过 ng-directives 扩展了 HTML
    + ng-app 指令定义一个 AngularJS 应用程序
    + ng-model 指令把元素值（比如输入域的值）绑定到应用程序
    + ng-bind 指令把应用程序数据绑定到 HTML 视图
- AngularJS 使得开发现代的单一页面应用程序（SPAs：Single Page Applications）变得更加容易
    + 把应用程序数据绑定到 HTML 元素
    + 可以克隆和重复 HTML 元素
    + 可以隐藏和显示 HTML 元素
    + 可以在 HTML 元素"背后"添加代码
    + 支持输入验证
- **AngularJS 指令** 以 ng 作为前缀的 HTML 属性
    + ng-init 指令初始化 AngularJS 应用程序变量
    + HTML5 允许扩展的（自制的）属性，以 data- 开头AngularJS 属性以 ng- 开头，但是您可以使用 data-ng- 来让网页对 HTML5 有效
- AngularJS 表达式
    + `{{ expression }}`
    + 把数据绑定到 HTML，这与 ng-bind 指令有异曲同工之妙
    + 将在表达式书写的位置"输出"数据
    + 很像 JavaScript 表达式：它们可以包含文字、运算符和变量
- AngularJS 应用
    + AngularJS 模块（Module） 定义了 AngularJS 应用
    + AngularJS 控制器（Controller） 用于控制 AngularJS 应用
    + ng-app指令定义了应用, ng-controller 定义了控制器

### 2 AngularJS 表达式
- AngularJS 数字
- AngularJS 字符串
- AngularJS 对象
- AngularJS 数组
- AngularJS 表达式 与 JavaScript 表达式的不同
    + 可以写在 HTML 中
    + 不支持条件判断，循环及异常
    + 支持过滤器

### 3 AngularJS 指令
- AngularJS 指令
    + AngularJS 通过被称为 指令 的新属性来扩展 HTML， 带有前缀 ng-
    + 通过内置的指令来为应用添加功能
    + 允许自定义指令
    + ng-app 指令初始化一个 AngularJS 应用程序。 **根元素** **自动引导（自动初始化）**
    + ng-init 指令初始化应用程序数据。通常情况下，不使用 ng-init。您将使用一个控制器或模块来代替它。
    + ng-model 指令把元素值（比如输入域的值）绑定到应用程序。
        * 为应用程序数据提供类型验证（number、email、required）。
        * 为应用程序数据提供状态（invalid、dirty、touched、error）。
        * 为 HTML 元素提供 CSS 类。
        * 绑定 HTML 元素到 HTML 表单。
- 数据绑定
- 重复 HTML 元素: `ng-repeat`
- 创建自定义的指令 `.directive`
- 限制使用 `restrict`  （默认是EA） 
    + E 作为元素名使用
    + A 作为属性使用
    + C 作为类名使用
    + M 作为注释使用
 