import urllib2

request = urllib2.Request("http://www.xxxxx.com")
try:
	urllib2.urlopen(request)
except urllib2.URLError, e:
	print e.reason

# [Errno 11004] getaddrinfo failed