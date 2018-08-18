RxSwift
---------
[RxSwift非官方中文文档](https://beeth0ven.github.io/RxSwift-Chinese-Documentation/)
[RxSwift 使用详解系列](https://www.jianshu.com/p/f61a5a988590)

[RxSwift实战教程-核心用法](https://www.jianshu.com/p/089ae5bececa)

## 1 介绍
### 1.1 Rx
- Rx 是 ReactiveX 的缩写，简单来说就是基于异步 Event（事件）序列的响应式编程。
- Rx 可以简化异步编程方法，并提供更优雅的数据绑定。让我们可以时刻响应新的数据同时顺序地处理它们。
- Rx 一种跨平台的标准。有许多基于不同开发语言的 Rx 的库。有相同的 API。
- [Rx主页](http://reactivex.io)


### 1.2 RxSwift
- Rx机制让程序里的事件传递响应方法比如：delegate、notification、target-action 等等）做到统一（，全部替换成 Rx 的“信号链”方式。

- RxSwift非常适合MVVM 开发模式

### 1.3 RxSwift 与 RxCocoa

- RxSwift：它只是基于 Swift 语言的 Rx 标准实现接口库，所以 RxSwift 里不包含任何 Cocoa 或者 UI方面的类。
- RxCocoa：是基于 RxSwift针对于 iOS开发的一个库，它通过 Extension 的方法给原生的比如 UI 控件添加了 Rx 的特性，使得我们更容易订阅和响应这些控件的事件。



