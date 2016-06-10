# -*- coding:utf-8 -*-
import urllib
import urllib2
import re

page = 1
url = 'http://www.qiushibaike.com/hot/page/' + str(page)
user_agent = 'Mozilla/4.0 (compatible; MSIE 5.5; Windows NT)'
headers = { 'User-Agent' : user_agent }
try:
    request = urllib2.Request(url,headers = headers)
    response = urllib2.urlopen(request)
    content = response.read().decode('utf-8')
    pattern = re.compile('<div.*?author">.*?<a.*?<img.*?>(.*?)</a>.*?<div.*?content">(.*?).*?</div>(.*?)<div class="stats.*?class="number">(.*?)</i>',re.S)
    # pattern = re.compile('class="article block untagged mb15"',re.S)
    items = re.findall(pattern,content)
    print items
    # for item in items:
    #     haveImg = re.search("img",item[3])
    #     if not haveImg:
    #         print item[0],item[1],item[2],item[4]
except urllib2.URLError, e:
    if hasattr(e,"code"):
        print e.code
    if hasattr(e,"reason"):
        print e.reason


# <div class="article block untagged mb15" id="qiushi_tag_116623604">

# <div class="author clearfix">
# <a href="/users/21532709/" target="_blank" rel="nofollow">
# <img src="http://pic.qiushibaike.com/system/avtnew/2153/21532709/medium/nopic.jpg" alt="浓缩六胃蹄髈丸">
# </a>
# <a href="/users/21532709/" target="_blank" title="浓缩六胃蹄髈丸">
# <h2>浓缩六胃蹄髈丸</h2>
# </a>
# </div>


# <div class="content">

# 和几个同龄结 为兄弟。<br>有次在家开黑，正玩得开心，一兄弟来电：兄弟，快来xx路，我和其他几个兄弟在打一个会跆 拳 道的。<br>我急忙问：战 况如何。<br>兄弟：我们都被揍了，就差你了。

# </div>



# <div class="stats">
# <span class="stats-vote"><i class="number">4592</i> 好笑</span>
# <span class="stats-comments">


# <span class="dash"> · </span>
# <a href="/article/116623604" data-share="/article/116623604" id="c-116623604" class="qiushi_comments" target="_blank">
# <i class="number">59</i> 评论
# </a>



# </span>
# </div>
# <div id="qiushi_counts_116623604" class="stats-buttons bar clearfix">
# <ul class="clearfix">
# <li id="vote-up-116623604" class="up">
# <a href="javascript:voting(116623604,1)" class="voting" data-article="116623604" id="up-116623604" rel="nofollow">
# <i class="iconfont" data-icon-actived="󰁡" data-icon-original="󰀟">󰀟</i>
# <span class="number hidden">4673</span>
# </a>
# </li>
# <li id="vote-dn-116623604" class="down">
# <a href="javascript:voting(116623604,-1)" class="voting" data-article="116623604" id="dn-116623604" rel="nofollow">
# <i class="iconfont" data-icon-actived="󰀠" data-icon-original="󰀠">󰀠</i>
# <span class="number hidden">-81</span>
# </a>
# </li>

# <li class="comments">
# <a href="/article/116623604" id="c-116623604" class="qiushi_comments" target="_blank">
# <i class="iconfont" data-icon-actived="󰁢" data-icon-original="󰀝">󰀝</i>
# </a>
# </li>

# </ul>
# </div>
# <div class="single-share">
# <a class="share-wechat" data-type="wechat" title="分享到微信" rel="nofollow">微信</a>
# <a class="share-qq" data-type="qq" title="分享到QQ" rel="nofollow">QQ</a>
# <a class="share-qzone" data-type="qzone" title="分享到QQ空间" rel="nofollow">QQ空间</a>
# <a class="share-weibo" data-type="weibo" title="分享到微博" rel="nofollow">微博</a>
# </div>
# <div class="single-clear"></div>

# </div>