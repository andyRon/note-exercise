#coding=utf-8
from crawling import download
import re
import urlparse
import robotparser
rp = robotparser.RobotFileParser()
rp.set_url('http://example.webscraping.com/robots.txt')
rp.read()
user_agent = 'GoodCrawler'


def link_crawler(seed_url, link_regex):
    crawl_queue = [seed_url]
    seen = set(crawl_queue)   # 避免重复
    while crawl_queue:
        url = crawl_queue.pop()
        if rp.can_fetch(user_agent, url):
            html = download(url)
            for link in get_links(html):
                if re.match(link_regex, link):
                    # 相对链接变为绝对链接
                    link = urlparse.urljoin(seed_url, link)
                    if link not in seen:
                        seen.add(link)
                        crawl_queue.append(link)
        else:
            print 'Blocked by robots.txt', url


def get_links(html):
    webpage_regex = re.compile('<a[^>]+href=["\'](.*?)["\']', re.IGNORECASE)
    return webpage_regex.findall(html)



# link_crawler("http://help.dangdang.com/details/page13", "")
link_crawler("http://example.webscraping.com", '/(index|view)')


# import robotparser
# rp = robotparser.RobotFileParser()
# rp.set_url('http://example.webscraping.com/robots.txt')
# rp.read()
# url = 'http://example.webscraping.com'
# user_agent = 'BadCrawler'
# print rp.can_fetch(user_agent, url)
# user_agent = 'GoodCrawler'
# print rp.can_fetch(user_agent, url)