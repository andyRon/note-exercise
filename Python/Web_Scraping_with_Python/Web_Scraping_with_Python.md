
### 注意
- python文件名不要以数字开头，不然import会失效


### 1 网络爬虫简介

- 1.3 背景调查
    + robots.txt  http://www.robotstxt.org/
    + 网站地图
    + 估计网站大小
        * 谷歌搜索`site:[网站域名]`
    + 识别网站所用技术 
        * `pip install builtwith`
        * `builtwith.parse('http://example.webscraping.com')`
    + `pip install python-whois`  

- 1.4 编写
    + http错误区分
    + 设置用户代理
    + 网站地图爬虫
    + ID遍历爬虫
    + 链接爬虫
        * `urlparse`
        * 避免重复
        * 解析robots.txt  `robotparser`
        * 支持代理
        * 下载限速  延迟固定时间
        * 爬虫陷阱  深度

### 2 数据抓取
- 三种网页抓取方法
    + 正则
    + BeautifulSoup
    + Lxml
    + 性能对比  
    + 抓取回调

### 3 下载缓存
- 磁盘缓存
- 压缩  
- 设置过期时间 ？？




