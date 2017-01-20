Scrapy学习 
http://scrapy-chs.readthedocs.io/zh_CN/latest/intro/overview.html
------------

### Scrapy入门教程
- [官方学习指南](https://wiki.python.org/moin/BeginnersGuide)
- 新建项目 `scrapy startproject tutorial2`
```
$ cd tutorial2
$ tree
.
├── scrapy.cfg                  项目的配置文件
└── tutorial2                   该项目的python模块。之后您将在此加入代码。
    ├── __init__.py
    ├── items.py                项目中的item文件.
    ├── middlewares.py
    ├── pipelines.py            项目中的pipelines文件.
    ├── settings.py             项目的设置文件.
    └── spiders                 放置spider代码的目录.
        └── __init__.py

2 directories, 7 files
```
- 定义Item
    + Item 是保存爬取到的数据的容器；其使用方法和python字典类似， 并且提供了额外保护机制来避免拼写错误导致的未定义字段错误。
- 编写第一个爬虫(Spider)
    + 在`tutorial/spiders`下建立文件`dmoz_spider.py`(文件随意)，在此文件建立一个类（类名随意，一定要继承`scrapy.spiders.Spider`）。类中定义三个属性：
        * `name` 爬虫的名字，要唯一
        * `start_urls` 包含了Spider在启动时进行爬取的url列表。初始URL
        * `parse()` 继承于`scrapy.spiders.Spider`。 被调用时，每个初始URL完成下载后生成的 Response 对象将会作为唯一的参数传递给该函数。 该方法负责解析返回的数据(response data)，提取数据(生成item)以及生成需要进一步处理的URL的 Request 对象。
- 爬取 
    + `scrapy crawl dmoz`
    + 生成两个文件
    + 过程： Scrapy为Spider的 start_urls 属性中的每个URL创建了 scrapy.Request 对象，并将 parse 方法作为回调函数(callback)赋值给了Request。Request对象经过调度，执行生成 scrapy.http.Response 对象并送回给spider parse() 方法。
- Selectors选择器简介
    + XPath [教程](http://www.w3school.com.cn/xpath/index.asp)
        * /html/head/title: 选择HTML文档中 <head> 标签内的 <title> 元素
        * /html/head/title/text(): 选择上面提到的 <title> 元素的文字
        * //td: 选择所有的 <td> 元素
        * //div[@class="mine"]: 选择所有具有 class="mine" 属性的 div 元素
    + Selector四个基本的方法
        * xpath(): 传入xpath表达式，返回该表达式所对应的所有节点的selector list列表 。
        * css(): 传入CSS表达式，返回该表达式所对应的所有节点的selector list列表.
        * extract(): 序列化该节点为unicode字符串并返回list。
        * re(): 根据传入的正则表达式对数据进行提取，返回unicode字符串list列表。
    + 在Shell中尝试Selector选择器
        * `scrapy shell "http://www.dmoz.org/Computers/Programming/Languages/Python/Books/"`  直接进入IPython
        * 得到一些本地变量
            - `response`  `response.body` `response.headers`
            - `sel`
                + sel.xpath('//title')
                + sel.xpath('//title').extract()
                + sel.xpath('//title/text()').extract()
                + sel.xpath('//title/text()').re('(\w+):')
                + sel.xpath('//ul/li/a/text()').extract()
                + sel.xpath('//ul/li/a/@href').extract()
        + 提取数据
            * firebug
        + 使用item
- 保存数据 `scrapy crawl dmoz -o items.json`

### 命令行工具
- 在命令行直接`scrapy`会看见，可用命令，在项目目录外和内可用命令是不同的。
- 全局命令
    + startproject
    + setting 
    + runspider
    + shell
    + fetch
    + view
    + version
- 项目(Project-only)命令
    + crawl
    + check
    + list
    + edit
    + parse
    + genspider
    + deploy
    + bench
- 帮助 `scrapy <command> -h` `scrapy  -h`
- `startproject`   `scrapy startproject <project_name>`
- `genspider`   `scrapy genspider [-t template] <name> <domain>`
    + `scrapy genspider -l`  查看有哪些模板
        ```
        $ scrapy genspider -l
        Available templates:
          basic
          crawl
          csvfeed
          xmlfeed
        ```
    + `scrapy genspider -d crawl`  查看具体模板的代码
    + `scrapy genspider -t basic example example.com`  在当前项目中创建一个name为**example**，start_urls是http://example.com/的爬虫（也就是在spiders/目录下建立一个文件）
- `crawl`   `scrapy crawl <spider>`
- `check`   `scrapy check [-l] <spider>`
- `list`    `scrapy list`  列出项目中可用的爬虫
- `edit`    `scrapy edit <spider>` 快捷编辑爬虫
- `fetch`   `scrapy fetch <url>`  使用Scrapy下载器(downloader)下载给定的URL，并将获取到的内容送到标准输出。
    + `scrapy fetch --headers --nolog http://www.baidu.com`
- `view`    `scrapy view <url>`  爬去页面并在浏览器中显示
- `shell`   `scrapy shell <url>` 
- `parse`   `scrapy parse <url> [options]`    ???
- `settings`  `scrapy settings [options]`   
    + `scrapy settings --get BOT_NAME`  获得项目对应的设置值
- `runspider`   `scrapy runspider <spider_file.py>`  在未创建项目的情况下，运行一个编写在Python文件中的spider。  ???
- 自定义项目命令  ???


### Items
- 爬取的主要目标就是从非结构性的数据源提取结构性数据
- Item的API与dictAPI类似
```
class Product(scrapy.item.Item):
    name = scrapy.Field()
    price = scrapy.Field()
product = Product(name='Desktop PC', price=1000)
product['name']
product.get('name')
product.get('names', 'no set')
'name' in product
product.keys()
product.items()
product2 = Product(product)                             # 复制
dict(product)                                           # 根据item创建字典(dict)
Product({'name': 'Laptop PC', 'price': 1500})           # 根据字典(dict)创建item    
product.fields                    # 相对于字典，Item唯一额外添加的属性。                      
```
- 扩展Item
```
class DiscountedProduct(Product):
    discount_percent = scrapy.Field(serializer=str)
    discount_expiration_date = scrapy.Field()
class SpecificProduct(Product):
    name = scrapy.Field(Product.fields['name'], serializer=my_serializer)
```

### Spiders
- Spider类定义了如何爬取某个(或某些)网站。包括了爬取的动作(例如:是否跟进链接)以及如何从网页的内容中提取结构化数据(爬取item)。 换句话说，Spider就是您定义爬取的动作及分析某个网页(或者是有些网页)的地方。
- Spider爬取的循环的过程：
    1. 以初始的URL初始化Request，并设置回调函数。 当该request下载完毕并返回时，将生成response，并作为参数传给该回调函数。 spider中初始的request是通过调用 start_requests() 来获取的。 start_requests() 读取 start_urls 中的URL， 并以 parse 为回调函数生成 Request 。
    2. 在回调函数内分析返回的(网页)内容，返回 Item 对象或者 Request 或者一个包括二者的可迭代容器。 返回的Request对象之后会经过Scrapy处理，下载相应的内容，并调用设置的callback函数(函数可相同)。
    3. 在回调函数内，您可以使用 选择器(Selectors) (您也可以使用BeautifulSoup, lxml 或者您想用的任何解析器) 来分析网页内容，并根据分析的数据生成item。
    4. 最后，由spider返回的item将被存到数据库(由某些 Item Pipeline 处理)或使用 Feed exports 存入到文件中。
- Spider参数
    + `-a`   `scrapy crawl myspider -a category=electronics` 在Spider构造器中获取参数：
    ```
    import scrapy

    class MySpider(Spider):
        name = 'myspider'

        def __init__(self, category=None, *args, **kwargs):
            super(MySpider, self).__init__(*args, **kwargs)
            self.start_urls = ['http://www.example.com/categories/%s' % category]
            # ...
    ```

    + 通过[scrapyd](http://scrapyd.readthedocs.io/en/stable/)获得

- 内置Spider参考手册
    + Scrapy提供多种方便的通用spider供您继承使用。都在`scrapy.spiders`下.
    + `Spider`  `scrapy.spiders.Spider` / `scrapy.Spider`   基础spider，每个其他的spider必须继承自该类(包括Scrapy自带的其他spider以及您自己编写的spider)。
    + `CrawlSpider`  `scrapy.spiders.CrawlSpider`  爬取一般网站常用的spider。其定义了一些规则(rule)来提供跟进link的方便的机制。 
        * `rules`  `scrapy.spiders.Rule`的list
        * `parse_start_url(response)`

    + `XMLFeedSpider`  `scrapy.spiders.XMLFeedSpider`
    + `CSVFeedSpider`   `scrapy.contrib.spiders.CSVFeedSpider`  除了其按行遍历而不是节点之外其他和XMLFeedSpider十分类似。 而其在每次迭代时调用的是 parse_row()
    + `SitemapSpider`  `scrapy.spiders.SitemapSpider`  通过 Sitemaps 来发现爬取的URL。其支持嵌套的sitemap，并能从 robots.txt 中获取sitemap的url。
    




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
`scrapy crawl mininova -o scraped_data.json`  中mininova是由name定义
