#coding=utf-8
import re

# print re.match(r'^1[358]\d{9}', '13221482639')
# print re.match(r'\d{3}-\d{7}', '010-8543210')
# print re.match(r'(P|p)ython', 'python')
# print re.match(r'^[0-9a-zA-Z_]&', '_1')
# print re.match(r'[0-9a-zA-Z_]{1}', '_1')



# print 'a b    c'.split(' ')
# print re.split(r'\s+', 'a b    c')

# print re.split(r'[\s,]+', 'a,b  c,d   e f')
# print re.split(r'[\s;]+', 'a;b;;c d;e  f')


# m = re.match(r'^(\d{3})-(\d{4,8})$', '021-23434')

# print m.group(1)
# print m.groups()

# 匹配时间
# t = '23:35:59'
# m = re.match(r'^(0[0-9]|1[0-9]|2[0-3]|[0-9]):([0-5][0-9]|[0-9]):([0-5][0-9]|[0-9])', t)

# print m.groups()

# d = '4-31'
# m = re.match(r'^(0[1-9]|1[0-2]|[1-9])-(0[1-9]|1[0-9]|2[0-9]|3[0-1]|[0-9])$', d)

# print m.groups()

# 贪婪和非贪婪
print re.match(r'^(\d+)(0*)$', '102300').groups()

print re.match(r'^(\d+?)(0*)$', '102300').groups()


re_telephone = re.compile(r'^(\d{3})-(\d{3,8})$')

print re_telephone

