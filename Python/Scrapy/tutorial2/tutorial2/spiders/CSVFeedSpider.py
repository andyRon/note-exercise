from scrapy import log
from scrapy.spiders import CSVFeedSpider
from tutorial2.items import DmozItem


class CSVFeedSpider(CSVFeedSpider):
    name = 'csvfeed'
    allowed_domains = ["dmoz.org"]
    start_urls = [
        'http://www.example.com/feed.csv'
    ]
    delimiter = ';'
    quotechar = "'"
    headers = ['title', 'link', 'desc']

    def parse_row(self, response, row):
        log.msg('Hi, this is a row!: %r' % row)

        item = DmozItem()
        item['title'] = row['title']
        item['link'] = row['link']
        item['desc'] = row['desc']
        return item