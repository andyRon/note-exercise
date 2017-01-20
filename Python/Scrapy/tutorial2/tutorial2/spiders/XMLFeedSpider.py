# -*- coding: utf-8 -*- 
from scrapy import log
from scrapy.spiders import XMLFeedSpider
from tutorial2.items import DmozItem


# 简单来说，我们在这里创建了一个spider，从给定的 start_urls 中下载feed， 并迭代feed中每个 item 标签，输出，并在 Item 中存储有些随机数据。
class XMLFeedSpider(XMLFeedSpider):
    name = 'xmlfeed'
    allowed_domains = ["dmoz.org"]
    start_urls = [
        "http://www.dmoz.org/Computers/Programming/Languages/Python/Books/",
        "http://www.dmoz.org/Computers/Programming/Languages/Python/Resources/"
    ]
    iterator = 'iternodes' # This is actually unnecessary, since it's the default value
    itertag = 'item'

    def parse_node(self, response, node):
        log.msg('Hi, this is a <%s> node!: %s' % (self.itertag, ''.join(node.extract())))

        item = DmozItem()
        item['title'] = response.xpath('a/text()').extract()
        item['link'] = response.xpath('a/@href').extract()
        item['desc'] = response.xpath('text()').extract()
        return item