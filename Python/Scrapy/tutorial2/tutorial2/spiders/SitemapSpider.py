# -*- coding: utf-8 -*- 
from scrapy import log
from scrapy.spiders import SitemapSpider
from tutorial2.items import DmozItem


class SitemapSpider(SitemapSpider):
    name = 'sitemap'
    allowed_domains = ["worktile.com"]
    sitemap_urls = ['http://www.worktile.com/sitemap.xml']


    sitemap_rules = [
        ('/blog/', 'parse_blog'),
        ('/club/', 'parse_club'),
    ]

    def parse(self, response):
        self.log('Hi, this is an item page! %s' % response.url)


    def parse_blog(self, response):
        self.log('Hi, 访问了blog，网址为： %s' % response.url)

    def parse_club(self, response):
        self.log('Hi, 访问了club，网址为： %s' % response.url)
