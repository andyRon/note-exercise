#!/usr/bin/python
#-*- coding: utf-8 -*-
import sys
reload(sys)
sys.setdefaultencoding('utf8')
import re
import csv
import lxml.html
import time
import datetime
import codecs
import urllib2
def askURL(url):
    request = urllib2.Request(url)#发送请求
    try:
        response = urllib2.urlopen(request)#取得响应
        html= response.read()#获取网页内容
    except urllib2.URLError, e:
        if hasattr(e,"code"):
            print e.code
        if hasattr(e,"reason"):
            print e.reason
    return html


def main():
    remove=re.compile(r'                            |</br>|\.*')
    baseurl = 'https://movie.douban.com/top250?start='
    datalist=[]
    for i in range(0,10):
        url=baseurl+str(i*25)
        html=askURL(url)      
        html=html.decode('utf-8').replace(u'\xa0', u' ')
        tree = lxml.html.fromstring(html)
        items=tree.cssselect('div.item')#找到每一个影片项
        for item in items:
            data=[]
            td=item.cssselect('div.hd a span.title')#片名可能只有一个中文名，没有外国名
            if(len(td)==2):
                ctitle=td[0].text_content()
                data.append(ctitle)#添加中文片名  
                otitle=td[1].text_content().replace(u'\xa0', u' ')
                otitle=otitle.replace(" / ","")#去掉无关符号               
                data.append(otitle)#添加外国片名
            else:
                data.append(td[0].text_content())#添加中文片名
                data.append(' ')#留空                         
            
            rating=item.cssselect('span.rating_num')[0]
            data.append(rating.text_content())#添加评分     
            judgeNum=item.cssselect('div.star span')[3]
            judgeNum=judgeNum.text_content().replace('人评价','')
            data.append(judgeNum)#添加评论人数
            
            inq=item.cssselect('p.quote')
            #可能没有概况
            if len(inq)!=0:
                inq=inq[0].text_content().replace("。","").strip()#去掉句号和没用的空格
                data.append(inq)#添加概况
            else:
                data.append(' ')#留空
            
            bd=item.cssselect('p')[0]
            bd=bd.text_content().replace(u'\xa0', u'/')
            bd=bd.encode('GBK','ignore')
            bd=bd.decode('GBK')
            bd=re.sub(remove,"",bd)
            bd=re.sub('\n',"|",bd)#去掉<br>
            bd=re.sub(': ',":",bd)#替换/
            bd=re.sub('<br/>',"",bd)#去掉<br>           
            bd=re.sub('///',"|",bd)#替换/
            words=bd.split("|")
            for s in words:
                if len(s)!=0 and s.strip()!='': #去掉空白内容
                    data.append(s)
            #主演有可能因为导演内容太长而没有
            if(len(data)!=10):
                data.insert(6,' ')#留空  
            datalist.append(data)
    return datalist
        

def saveData(datalist,savepath):
    with open(savepath, 'wb') as fp:
        fp.write(codecs.BOM_UTF8)   
        writer = csv.writer(fp)     
        writer.writerow(['影片中文名','影片外国名',
             '评分','评价数','概况','导演','主演','年份','地区','类别'])
        for i in datalist:
            writer.writerow(i)     
    fp.close()

    
if __name__ == '__main__':
    start=datetime.datetime.now()
    print u"程序开始时间：%s\n" % str(start)  
    
    savepath=u'我的豆瓣_2.csv'
    datalist=main()
    saveData(datalist, savepath)
   
    end=datetime.datetime.now()
    print u"程序结束时间：%s" % str(end)    
    print u"总耗时：%s" % str(end-start) 