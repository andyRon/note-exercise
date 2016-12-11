#coding=utf-8
from crawling import download
from crawling import download2
import re
import urlparse
import robotparser
from crawling import Throttle


def link_crawler(seed_url, link_regex, user_agent = "GoodCrawler", delay = 2, max_depth = 2):
    crawl_queue = [seed_url]
    # seen = set(crawl_queue)   # 避免重复
    seen = {}
    seen[seed_url] = 0
    throttle = Throttle(delay)
    while crawl_queue:
        url = crawl_queue.pop()
        if rp.can_fetch(user_agent, url):
            throttle.wait(url)
            html = download(url)
            depth = seen[url]
            if depth != max_depth:
                for link in get_links(html):
                    if re.match(link_regex, link):
                        # 相对链接变为绝对链接
                        link = urlparse.urljoin(seed_url, link)
                        if link not in seen:
                            crawl_queue.append(link)
                            seen[link] = depth + 1
        else:
            print 'Blocked by robots.txt', url


def get_links(html):
    webpage_regex = re.compile('<a[^>]+href=["\'](.*?)["\']', re.IGNORECASE)
    return webpage_regex.findall(html)

def get_robots(url):
    rp = robotparser.RobotFileParser()
    rp.set_url(urlparse.urljoin(url, '/robots.txt'))
    rp.read()
    return rp

# link_crawler("http://help.dangdang.com/details/page13", "")
link_crawler("http://example.webscraping.com", '/(index|view)', max_depth=1)


# import robotparser
# rp = robotparser.RobotFileParser()
# rp.set_url('http://example.webscraping.com/robots.txt')
# rp.read()
# url = 'http://example.webscraping.com'
# user_agent = 'BadCrawler'
# print rp.can_fetch(user_agent, url)
# user_agent = 'GoodCrawler'
# print rp.can_fetch(user_agent, url)

delay = 2

throttle = Throttle(delay)
