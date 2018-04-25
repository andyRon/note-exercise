
### 注意
- python文件名不要以数字开头，不然import会失效


### 1 网络爬虫简介

- 1.3 背景调查
    + robots.txt  http://www.robotstxt.org/
    + 网站地图
    + 估计网站大小
        * 谷歌搜索`site:[网站域名]`
    + 识别网站所用技术 (使用那些框架和库等)
        * `pip install builtwith`
        * `builtwith.parse('http://example.webscraping.com')`
    + `pip install python-whois`  

- 1.4 编写
    + http错误区分
    + 设置用户代理
    + 网站地图爬虫
    + ID遍历爬虫
    + 链接爬虫
        * `urlparse` 创建绝对路径模块
        * 避免重复
        * 解析robots.txt  `robotparser`模块
        * 支持代理
        * 下载限速  延迟固定时间
        * 爬虫陷阱  深度
    + `itertools` 生成迭代器

### 2 数据抓取
- 三种网页抓取方法
    + 正则
    + BeautifulSoup
    + Lxml
    + 性能对比  
    + 抓取回调

### 3 下载缓存
- 磁盘缓存
`pickle` 序列化对象
`zlib` 压缩
`__getattr` 当调用不存在的属性（比如 z）时，解释器就会试图调用 __getattr__(self, 'z') 来获取值，
- 压缩  
- 设置过期时间 ？？
- 3.3 数据库缓存
    + 安装MongoDB
    + 安装MongoDB的Python封装包 `pip install pymongo`
    + 本地启动MongoDB `mongod -dbpath .`（在当前目录生成一些文件）
    + 




