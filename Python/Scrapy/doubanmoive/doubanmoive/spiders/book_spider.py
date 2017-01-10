# -*- coding: utf-8 -*- 
from scrapy.selector import Selector 
from scrapy.spiders import CrawlSpider,Rule 
from scrapy.linkextractors import LinkExtractor 
from doubanmoive.items import DoubanbookItem 

class MoiveSpider2015(CrawlSpider): 
    name="bookspider" 
    allowed_domains=["book.douban.com"] 
    start_urls=["https://book.douban.com/tag/程序"] 
    rules=[ 
        Rule(LinkExtractor(allow=(r'https://book.douban.com/tag/程序\?start=\d+.*'))), 
        Rule(LinkExtractor(allow=(r'https://book.douban.com/subject/\d+')),callback="parse_item"), 
    ] 

    def parse_item(self,response): 
        sel=Selector(response) 
        item=DoubanbookItem() 
        item['name']=sel.xpath('///*[@id="wrapper"]/h1/span/text()').extract()
        item['author']=sel.xpath('').extract('//*[@id="info"]/span[1]/a[1]/text()').extract()
        # item['year']=sel.xpath('//*[@id="info"]/text()[4]').extract()
        item['score']=sel.xpath('//*[@id="interest_sectl"]/div/div[2]/strong/text()').extract() 
        item['rating_people']=sel.xpath('//*[@id="interest_sectl"]/div[1]/div[2]/div/div[2]/span/a/span/text()').extract()
        # item['pages']=sel.xpath('//*[@id="info"]/text()[4]').extract()
        return item

# scrapy crawl bookspider -o bookspider_程序.json

