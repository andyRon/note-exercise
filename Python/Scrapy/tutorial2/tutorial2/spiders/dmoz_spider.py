# -*- coding: utf-8 -*- 
import scrapy
from tutorial2.items import DmozItem
from tutorial2.items import Website


class DmozSpider(scrapy.spiders.Spider):
    name = "dmoz"
    allowed_domains = ["dmoz.org"]
    start_urls = [
        "http://www.dmoz.org/Computers/Programming/Languages/Python/Books/",
        "http://www.dmoz.org/Computers/Programming/Languages/Python/Resources/"
    ]

    def parse(self, response):
        # filename = response.url.split("/")[-2]
        # with open(filename, 'wb') as f:
        #     f.write(response.body)

        # for sel in response.xpath('//ul/li'):
        #     title = sel.xpath('a/text()').extract()
        #     link = sel.xpath('a/@href').extract()
        #     desc = sel.xpath('text()').extract()
        #     print title, link, desc

        for sel in response.xpath('//ul/li'):
            item = DmozItem()
            item['title'] = sel.xpath('a/text()').extract()
            item['link'] = sel.xpath('a/@href').extract()
            item['desc'] = sel.xpath('text()').extract()
            yield item

class DirbotSpider(scrapy.spiders.Spider):
    name = "dirbot"
    allowed_domains = ["dmoz.org"]
    start_urls = [
        "http://www.dmoz.org/Computers/Programming/Languages/Python/Books/",
        "http://www.dmoz.org/Computers/Programming/Languages/Python/Resources/"
    ]
    def parse(self, response):
        """
        The lines below is a spider contract. For more info see:
        http://doc.scrapy.org/en/latest/topics/contracts.html
        @url http://www.dmoz.org/Computers/Programming/Languages/Python/Resources/
        @scrapes name
        """
        sites = response.css('#site-list-content > div.site-item > div.title-and-desc')
        items = []

        for site in sites:
            item = Website()
            item['name'] = site.css(
                'a > div.site-title::text').extract_first().strip()
            item['url'] = site.xpath(
                'a/@href').extract_first().strip()
            item['description'] = site.css(
                'div.site-descr::text').extract_first().strip()
            items.append(item)

        return items


# 传递参数测试
class MySpider(scrapy.spiders.Spider):
    name = 'myspider1'

    def __init__(self, category=None, *args, **kwargs):
        super(MySpider, self).__init__(*args, **kwargs)
        self.start_urls = ['http://www.example.com/categories/%s' % category]
        # ...


class MySpider2(scrapy.Spider):
    name = 'myspider2'
    allowed_domains = ["dmoz.org"]
    start_urls = [
        "http://www.dmoz.org/Computers/Programming/Languages/Python/Books/",
        "http://www.dmoz.org/Computers/Programming/Languages/Python/Resources/"
    ]

    def parse(self, response):
        self.log('A response from %s just arrived!' % response.url)

# 在单个回调函数中返回多个Request以及Item的例子
class MySpider3(scrapy.Spider):
    name = 'myspider3'
    allowed_domains = ["dmoz.org"]
    start_urls = [
        "http://www.dmoz.org/Computers/Programming/Languages/Python/Books/",
        "http://www.dmoz.org/Computers/Programming/Languages/Python/Resources/"
    ]

    def parse(self, response):
        sel = scrapy.Selector(response)
        for h3 in response.xpath('//h3').extract():
            yield DmozItem(title=h3)

        for url in response.xpath('//a/@href').extract():
            yield scrapy.Request(url, callback=self.parse)




