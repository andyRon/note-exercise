# coding=utf-8
__author__ = 'CQC'
 
# 导入re模块
import re
 
# 将正则表达式编译成Pattern对象，注意hello前面的r的意思是“原生字符串”
pattern = re.compile(r'hello', re.I)
 
# 使用re.match匹配文本，获得匹配结果，无法匹配时将返回None
result1 = re.match(pattern,'heLlo')
result2 = re.match(pattern,'helloo CQC!')
result3 = re.match(pattern,'helo CQC!')
result4 = re.match(pattern,'hello CQC!')
 

print result1.string
print result1.re
print result1.pos
print result2.endpos


# 匹配如下内容：单词+空格+单词+任意字符
pattern = re.compile(r"(\w+) (\w+)(.*)")
m = re.match(pattern, 'hello world!')
 
print "m.string:", m.string
print "m.re:", m.re
print "m.pos:", m.pos
print "m.endpos:", m.endpos
print "m.lastindex:", m.lastindex
print "m.lastgroup:", m.lastgroup
print "m.group():", m.group()
print "m.group(1,2):", m.group(1, 2)
print "m.groups():", m.groups()
print "m.groupdict():", m.groupdict()
print "m.start(1):", m.start(1)
print "m.end(2):", m.end(2)
print "m.span(2):", m.span(2)
print r"m.expand(r'\g \g\g'):", m.expand(r'\2 \1\3')


# 将正则表达式编译成Pattern对象
pattern = re.compile(r'world')
# 使用search()查找匹配的子串，不存在能匹配的子串时将返回None
# 这个例子中使用match()无法成功匹配
match = re.search(pattern,'hello world!')
if match:
    # 使用Match获得分组信息
    print match.group()

pattern = re.compile(r'\d+')
print re.split(pattern, "one1two2three3four4", 3)
print re.findall(pattern, "one1two2three3four4")

for m in re.finditer(pattern, "one1two2three3four4"):
	print m.group()


pattern = re.compile(r'(\w+) (\w+)')
s = 'i say, hello world!'

print re.sub(pattern, r'\2 \1', s)

def sub(m):
	return m.group(1).title() + " " + m.group(2).title()

print re.sub(pattern, sub, s)


print re.subn(pattern, r'\2 \1', s)



print re.subn(pattern, sub, s)



print pattern.sub(r'121\2-\1', s)




