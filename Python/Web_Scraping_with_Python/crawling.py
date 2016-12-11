#coding=utf-8
import re 
import urllib2 
import urlparse
import datetime
import time

def download(url, user_agent = 'wswp', num_re = 2):
    print "Downloading:", url 
    try:
        headers = {'User-agent': user_agent}
        request = urllib2.Request(url, headers = headers)
        html = urllib2.urlopen(request).read()
    except urllib2.URLError as e:
        print 'Download error:', e.reason
        html = None
        if num_re > 0 and hasattr(e, 'code') and 500 <= e.code < 600:
            return download(url, num_re = num_re-1)
    return html;



def crawling_sitemap(url):
    sitemap = download(url)

    links = re.findall('<loc>(.*?)</loc>', sitemap)

    for link in links:
        html = download(link)

    return 'over'


# 支持代理
def download2(url, user_agent = 'wswp', proxy = None, num_re = 2):
    print "Downloading:", url 
    headers = {'User-agent': user_agent}
    request = urllib2.Request(url, headers = headers)

    opener = urllib2.build_opener()
    if proxy:
        proxy_params = {urlparse.urlparse(url).schem: proxy}
        opener.add_handler(urllib2.ProxyHandler(proxy_params))
    try:
        html = opener.open(request).read()
    except urllib2.URLError as e:
        print 'Download error:', e.reason
        html = None
        if num_re > 0 and hasattr(e, 'code') and 500 <= e.code < 600:
            return download(url, num_re = num_re-1)
    return html;


class Throttle:
    def __init__(self, delay):
        # 设置延迟时间
        self.delay = delay 
        # 域名上次访问的时间
        self.domains = {}

    def wait(self, url):
        domain = urlparse.urlparse(url).netloc
        last_accessed = self.domains.get(domain)

        if self.delay > 0 and last_accessed is not None:
            sleep_secs = self.delay - (datetime.datetime.now() - last_accessed).seconds
            if sleep_secs > 0:
                time.sleep(sleep_secs)
        self.domains[domain] = datetime.datetime.now()


