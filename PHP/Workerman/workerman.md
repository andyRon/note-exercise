workerman 学习记录
------------------
[手册](http://doc3.workerman.net/principle/README.html)
------------------
### 安装
    - 检测是否满足

            $ curl -Ss http://www.workerman.net/check.php | php
            PHP Version >= 5.3.3                  [OK]
            Extension pcntl check                 [fail]
            Extension posix check                 [OK]

    - 安装 pcntl
    - 启动与停止
        - 以debug（调试）方式启动   
        `php start.php start`
        - 以daemon（守护进程）方式启动  
        `php start.php start -d`
        - 停止  
        `php start.php stop`
        - 重启  
        `php start.php restart`
        - 平滑重启
        `php start.php reload`
        - 查看状态
        `php start.php status`
        - 强行杀死所有workerman进程
        （要求workerman版本>=3.2.2）
        `php start.php kill`


### 序言、入门指引
    - 传统的PHP应用程序基本上是在Apache等**Web容器**中运行的，浏览器与Web容器采用HTTP协议通信，然而在很多实际项目中HTTP协议无法满足我们的需求，尤其是在服务端和客户端要保持长连接，做实时双向通讯时，HTTP协议显得力不从心。例如即时IM通讯，游戏服务器通讯，与硬件传感器通讯等等，开发这些应用程序我们无法直接使用nginx/apache + PHP来实现，也更无法使用传统的PHP框架来做
    - WorkerMan是一款纯PHP开发的开源的高性能的PHP socket服务器框架，基于WorkerMan开发者可以开发出各种网络服务器，例如基于websocket的服务器、游戏服务器、移动通讯服务器、智能家居服务端、物联网服务、web服务器、RPC服务器等等。几乎任何基于TCP/UDP通讯的服务端都可以用WorkerMan来开发。WorkerMan使得开发者摆脱PHP只能用于Web开发的束缚，向更广阔的前景发展。
    - [Libevent]()
    - POSIX标准
    - pcntl扩展
    - libevent扩展 或者 Event扩展

### 开发流程

### 定制通信协议
    - WorkerMan目前已经支持HTTP、websocket、text协议(见附录说明)、frame协议(见附录说明)，ws协议(见附录说明)，需要基于这些协议通讯时可以直接使用，使用方法及时在初始化Worker时指定协议
    - 定制协议

