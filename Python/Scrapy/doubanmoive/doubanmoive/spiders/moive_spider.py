# -*- coding: utf-8 -*- 
from scrapy.selector import Selector 
from scrapy.spiders import CrawlSpider,Rule 
# from scrapy.linkextractors.sgml import SgmlLinkExtractor 
# from scrapy.linkextractors.LinkExtractor import SgmlLinkExtractor
from scrapy.linkextractors import LinkExtractor as SgmlLinkExtractor
from doubanmoive.items import DoubanmoiveItem 

class MoiveSpider(CrawlSpider): 
    name="doubanmoive" 
    allowed_domains=["movie.douban.com"] 
    start_urls=["https://movie.douban.com/top250"] 
    rules=[ 
        Rule(SgmlLinkExtractor(allow=(r'https://movie.douban.com/top250\?start=\d+.*'))), 
        Rule(SgmlLinkExtractor(allow=(r'https://movie.douban.com/subject/\d+')),callback="parse_item"), 
    ] 

    def parse_item(self,response): 
        sel=Selector(response) 
        item=DoubanmoiveItem() 
        item['name']=sel.xpath('//*[@id="content"]/h1/span[1]/text()').extract()
        item['year']=sel.xpath('//*[@id="content"]/h1/span[2]/text()').re(r'\((\d+)\)') 
        item['score']=sel.xpath('//*[@id="interest_sectl"]/div[1]/div[2]/strong/text()').extract() 
        item['director']=sel.xpath('//*[@id="info"]/span[1]/span[2]/a/text()').extract() 
        item['classification']= sel.xpath('//span[@property="v:genre"]/text()').extract() 
        item['actor']= sel.xpath('//*[@id="info"]/span[3]/span[2]/a[@rel="v:starring"]/text()').extract() 
        return item



# scrapy parse --spider=doubanmoive  -d 3 "http://movie.douban.com/top250"
# scrapy view  "https://movie.douban.com/top250"
# scrapy crawl doubanmoive -o items.json


# //*[@id="interest_sectl"]/div[1]/div[2]/strong