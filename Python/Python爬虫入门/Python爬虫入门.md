[Python爬虫入门](http://python.jobbole.com/81332/)
----------------------------

- Urllib库的使用
    + 抓网页
            
            import urllib2
 
            response = urllib2.urlopen("http://www.baidu.com")
            print response.read()

    + 构造Requset
    + POST和GET数据传送
    + 设置header   
    对付”反盗链”的方式，对付防盗链，服务器会识别headers中的referer是不是它自己，如果不是，有的服务器不会响应

            User-Agent : 有些服务器或 Proxy 会通过该值来判断是否是浏览器发出的请求
            Content-Type : 在使用 REST 接口时，服务器会检查该值，用来确定 HTTP Body 中的内容该怎样解析。
            application/xml ： 在 XML RPC，如 RESTful/SOAP 调用时使用
            application/json ： 在 JSON RPC 调用时使用
            application/x-www-form-urlencoded ： 浏览器提交 Web 表单时使用
            在使用服务器提供的 RESTful 或 SOAP 服务时， Content-Type 设置错误会导致服务器拒绝服务
    + Proxy（代理）的设置
    + Timeout 设置
        
            response = urllib2.urlopen('http://www.baidu.com', timeout=10)
            response = urllib2.urlopen('http://www.baidu.com', data, 10)
    + 使用 HTTP 的 PUT 和 DELETE 方法
    
            import urllib2
            request = urllib2.Request(uri, data=data)
            request.get_method = lambda: 'PUT' # or 'DELETE'
            response = urllib2.urlopen(request)
    + 使用DebugLog

- 异常处理
    + URLError
        * 原因
            - 网络无连接，即本机无法上网
            - 连接不到特定的服务器
            - 服务器不存在
    + HTTPError (URLError的子类)

- Cookie的使用





--------------

### 
