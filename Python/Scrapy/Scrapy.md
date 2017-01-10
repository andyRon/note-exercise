Scrapy学习 
http://scrapy-chs.readthedocs.io/zh_CN/latest/intro/overview.html
------------

### Scrapy入门教程

### 命令行工具

### Items
- 爬取的主要目标就是从非结构性的数据源提取结构性数据

### Spiders
- Spider类定义了如何爬取某个(或某些)网站。包括了爬取的动作(例如:是否跟进链接)以及如何从网页的内容中提取结构化数据(爬取item)。 换句话说，Spider就是您定义爬取的动作及分析某个网页(或者是有些网页)的地方。


### 选择器(Selectors)
- 通过特定的 XPath 或者 CSS 表达式来“选择” HTML文件中的某个部分。
- Scrapy选择器构建于 lxml 库之上，这意味着它们在速度和解析准确性上非常相似。

### Item Loaders
-  Items 提供保存抓取数据的 容器 ， 而 Item Loaders提供的是 填充 容器的机制。

### Scrapy终端(Scrapy shell)

### Item Pipeline

### Feed exports

### Link Extractors
- Link Extractors 是用于从网页(scrapy.http.Response )中抽取会被follow的链接的对象。

### Logging

### 数据收集(Stats Collection)

### 发送email

### Telnet终端(Telnet Console)

scrapy使用记录
-----------
- 新建爬虫 `scrapy startproject spidername` 

