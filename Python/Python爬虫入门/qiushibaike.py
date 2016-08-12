# -*- coding:utf-8 -*-
import urllib
import urllib2
import re


url = r'http://www.qiushibaike.com/hot/page/2'

html = urllib2.urlopen(url).read()

print html

print dir(urllib2)