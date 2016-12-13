import urllib2 
from bs4 import BeautifulSoup

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


# url = 'http://example.webscraping.com/view/Anguilla-8'
# html = download(url)
# soup = BeautifulSoup(html, 'html.parser')

# tr = soup.find('tr', {'id':'places_area__row'})

# # print tr
# td = tr.find('td', {'class':'w2p_fw'})
# area = td.text
# print area

