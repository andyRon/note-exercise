
import urllib
import urllib2

url = ""
values = {"username":"", "password":"xxx"}
user_agent = "Mozilla/4.0 (compatible; MSIE 5.5; Windows NT)"
data = urllib.urlencode(values)
headers = {"User-Agent": user_agent, 'Referer':'http://www.zhihu.com/articles'}

request = urllib2.Request(url, data, headers) 
response = request.urlopen()

print response.read()