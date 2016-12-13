import lxml.html
import csv
import urllib2 
from link_crawler import link_crawler
import re

class ScrapeCallback:
    def __init__(self):
        self.writer = csv.writer(open('countries.csv', 'w'))
        self.fields = ('area', 'population', 'iso', 'country', 'capital', 'continent', 'tld', 'currency_code', 'currency_name', 'phone', 'postal_code_format', 'postal_code_regex', 'languages', 'neighbours')
        self.writer.writerow(self.fields)

    def __call__(self, url, html):
        if re.search('/view/', url):
            tree = lxml.html.fromstring(html)
            row = []
            for field in self.fields:
                l = tree.cssselect('table > tr#places_{}__row > td.w2p_fw'.format(field))
                if len(l) > 0: 
                    row.append(l[0].text_content())
            self.writer.writerow(row)



link_crawler('http://example.webscraping.com/', '/(index|view)', max_depth=1, delay=0, scrape_callback=ScrapeCallback())


# print tree.cssselect('table > tr#places_area__row > td.w2p_fw')[0].text_content()
# print tree.cssselect('table > tr#places_area__row > td.w2p_fw')
# print tree.cssselect('table > tr#places_area__row > td.w2p_fw')