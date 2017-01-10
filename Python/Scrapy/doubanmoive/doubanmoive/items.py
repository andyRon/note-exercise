# -*- coding: utf-8 -*-

# Define here the models for your scraped items
#
# See documentation in:
# http://doc.scrapy.org/en/latest/topics/items.html

import scrapy
from scrapy import Item, Field

class DoubanmoiveItem(scrapy.Item):
    name=Field()#电影名 
    year=Field()#上映年份 
    score=Field()#豆瓣分数 
    director=Field()#导演 
    classification=Field()#分类 
    actor=Field()#演员

class DoubanbookItem(scrapy.Item):
    name=Field()    #书名
    author=Field()  #作者
    # year=Field()    #出版年
    score=Field()   #评分
    rating_people=Field()   #评分人数
    # pages=Field()   #页数
    # ISBN=Field()    #ISBN