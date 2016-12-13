# -*- coding: utf-8 -*-
import scrapy


class SinaSpider(scrapy.Spider):
    name = "sina"
    allowed_domains = ["http://www.sina.com.cn/"]
    start_urls = ['http://http://www.sina.com.cn//']

    def parse(self, response):
        pass
