RxSwift

# [RxSwift非官方中文文档](https://beeth0ven.github.io/RxSwift-Chinese-Documentation/)

## 1.为什么要使用 RxSwift ？

### Target Action



传统实现方法：

```swift
button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
func buttonTapped() {
    print("button Tapped")
}
```

通过 Rx 来实现：

```swift
button.rx.tap
    .subscribe(onNext: {
        print("button Tapped")
    })
    .disposed(by: disposeBag)
```



### 代理

传统实现方法：

```swift
class ViewController: UIViewController {
    ...
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("contentOffset: \(scrollView.contentOffset)")
    }
}
```

通过 Rx 来实现：

```swift
class ViewController: UIViewController {
    ...
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.rx.contentOffset
            .subscribe(onNext: { contentOffset in
                print("contentOffset: \(contentOffset)")
            })
            .disposed(by: disposeBag)
    }
}
```

### 闭包回调

传统实现方法：

```swift
URLSession.shared.dataTask(with: URLRequest(url: url)) {
    (data, response, error) in
    guard error == nil else {
        print("Data Task Error: \(error!)")
        return
    }

    guard let data = data else {
        print("Data Task Error: unknown")
        return
    }

    print("Data Task Success with count: \(data.count)")
}.resume()
```

通过 Rx 来实现：

```swift
URLSession.shared.rx.data(request: URLRequest(url: url))
    .subscribe(onNext: { data in
        print("Data Task Success with count: \(data.count)")
    }, onError: { error in
        print("Data Task Error: \(error)")
    })
    .disposed(by: disposeBag)
```

### 通知

传统实现方法：

```swift
var ntfObserver: NSObjectProtocol!

override func viewDidLoad() {
    super.viewDidLoad()

    ntfObserver = NotificationCenter.default.addObserver(
          forName: .UIApplicationWillEnterForeground,
          object: nil, queue: nil) { (notification) in
        print("Application Will Enter Foreground")
    }
}

deinit {
    NotificationCenter.default.removeObserver(ntfObserver)
}
```

通过 Rx 来实现：

```swift
override func viewDidLoad() {
    super.viewDidLoad()

    NotificationCenter.default.rx
        .notification(.UIApplicationWillEnterForeground)
        .subscribe(onNext: { (notification) in
            print("Application Will Enter Foreground")
        })
        .disposed(by: disposeBag)
}
```

你不需要去管理观察者的生命周期，这样你就有更多精力去关注业务逻辑。

### 多个任务之间有依赖关系

例如，先通过用户名密码取得 Token 然后通过 Token 取得用户信息，

传统实现方法：

```swift
/// 用回调的方式封装接口
enum API {

    /// 通过用户名密码取得一个 token
    static func token(username: String, password: String,
        success: (String) -> Void,
        failure: (Error) -> Void) { ... }

    /// 通过 token 取得用户信息
    static func userinfo(token: String,
        success: (UserInfo) -> Void,
        failure: (Error) -> Void) { ... }
}
/// 通过用户名和密码获取用户信息
API.token(username: "beeth0ven", password: "987654321",
    success: { token in
        API.userInfo(token: token,
            success: { userInfo in
                print("获取用户信息成功: \(userInfo)")
            },
            failure: { error in
                print("获取用户信息失败: \(error)")
        })
    },
    failure: { error in
        print("获取用户信息失败: \(error)")
})
```

通过 Rx 来实现：

```swift
/// 用 Rx 封装接口
enum API {

    /// 通过用户名密码取得一个 token
    static func token(username: String, password: String) -> Observable<String> { ... }

    /// 通过 token 取得用户信息
    static func userInfo(token: String) -> Observable<UserInfo> { ... }
}
/// 通过用户名和密码获取用户信息
API.token(username: "beeth0ven", password: "987654321")
    .flatMapLatest(API.userInfo)
    .subscribe(onNext: { userInfo in
        print("获取用户信息成功: \(userInfo)")
    }, onError: { error in
        print("获取用户信息失败: \(error)")
    })
    .disposed(by: disposeBag)
```

这样你可以[避免回调地狱](https://en.wiktionary.org/wiki/callback_hell)，从而使得代码易读，易维护。

### 等待多个并发任务完成后处理结果

例如，需要将两个网络请求合并成一个，

通过 Rx 来实现：

```swift
/// 用 Rx 封装接口
enum API {

    /// 取得老师的详细信息
    static func teacher(teacherId: Int) -> Observable<Teacher> { ... }

    /// 取得老师的评论
    static func teacherComments(teacherId: Int) -> Observable<[Comment]> { ... }
}
/// 同时取得老师信息和老师评论
Observable.zip(
      API.teacher(teacherId: teacherId),
      API.teacherComments(teacherId: teacherId)
    ).subscribe(onNext: { (teacher, comments) in
        print("获取老师信息成功: \(teacher)")
        print("获取老师评论成功: \(comments.count) 条")
    }, onError: { error in
        print("获取老师信息或评论失败: \(error)")
    })
    .disposed(by: disposeBag)
```









# [RxSwift 使用详解系列](https://www.jianshu.com/p/f61a5a988590)


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



