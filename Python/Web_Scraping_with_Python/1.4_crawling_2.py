import urllib2 

def download(url, num_re = 2):
    print "Downloading:", url 
    try:
        html = urllib2.urlopen(url).read()
    except urllib2.URLError as e:
        print "Download error.", e.reason
        html = None
        if num_re > 0 and hasattr(e, 'code') and 500 <= e.code < 600:
            return download(url, num_re-1)
               
    return html


print download("http://httpstat.us/500")
# print download("https://www.meetup.com/")



