# -*- coding: utf-8 -*- 
import scrapy
from tutorial2.items import DmozItem
from tutorial2.items import Website
from scrapy.spiders import CrawlSpider, Rule
from scrapy.linkextractors import LinkExtractor


class CrawlSpider(CrawlSpider):
    name = "crawlspider"
    allowed_domains = ["dmoz.org"]
    start_urls = [
        "http://www.dmoz.org/Computers/Programming/Languages/Python/Books/",
        "http://www.dmoz.org/Computers/Programming/Languages/Python/Resources/"
    ]

    rules = (
        # # 提取匹配 'category.php' (但不匹配 'subsection.php') 的链接并跟进链接(没有callback意味着follow默认为True)
        # Rule(LinkExtractor(allow=('category\.php', ), deny=('subsection\.php', ))),

        # # 提取匹配 'item.php' 的链接并使用spider的parse_item方法进行分析
        # Rule(LinkExtractor(allow=('item\.php', )), callback='parse_item'),

        # 在初始url中发现类似 http://www.dmoz.org/docs 就继续爬取，并回调parse_item2
        Rule(LinkExtractor(allow=('docs',)), callback='parse_item2'),
    )

    # def parse_item(self, response):
    #     self.log('Hi, this is an item page! %s' % response.url)

    #     item = scrapy.Item()
    #     item['id'] = response.xpath('//td[@id="item_id"]/text()').re(r'ID: (\d+)')
    #     item['name'] = response.xpath('//td[@id="item_name"]/text()').extract()
    #     item['description'] = response.xpath('//td[@id="item_description"]/text()').extract()
    #     return item
      
    def parse_item2(self, response):
        self.log('Hi, this is an item page! %s' % response.url)

        item = DmozItem()
        item['title'] = response.xpath('a/text()').extract()
        item['link'] = response.xpath('a/@href').extract()
        item['desc'] = response.xpath('text()').extract()
        return item



