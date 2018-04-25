from pymongo import MongoClient 
client = MongoClient('localhost', 27017)

url = 'http://---3'
html = '---'
db = client.cache 
# db.webpage.insert({'url': url, 'html': html})
print db.webpage.find({'url': url})