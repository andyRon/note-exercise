import urllib
import urllib2

values = {"username":"rongming.2008@163.com", 'password':"******"}
data = urllib.urlencode(values)
request = urllib2.Request("https://passport.csdn.net/account/login?from=http://my.csdn.net/my/mycsdn", data)
response = urllib2.urlopen(request)

print response.read()

# 不能直接登录，还差head