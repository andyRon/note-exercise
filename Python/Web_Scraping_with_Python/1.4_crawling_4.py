import re 
import urllib2 

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



# crawling_sitemap("http://example.webscraping.com/sitemap.xml")

# crawling_sitemap("http://www.kancloud.cn/sitemap.xml")


import itertools
max_errors = 5
num_errors = 0
for page in itertools.count(24037651):
    # url = 'http://example.webscraping.com/view/%d' % page
    # url = 'https://www.juhe.cn/docs/index/cid/%d' % page
    url = 'http://product.dangdang.com/%d.html' % page

    html = download(url)
    if html is None:
        num_errors += 1
        if num_errors == max_errors :
            break
    else:
        pass