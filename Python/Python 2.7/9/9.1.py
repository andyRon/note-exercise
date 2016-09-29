#coding=utf-8
# f = open("/Users/andyron/myfield/github/note-exercise/Python/Python 2.7/9/test.txt", "r")

# print f.read()

# f.close()




# try:
#     f = open('/path/to/file', 'r')
#     print f.read()
# finally:
#     if f:
#         f.close()

# 简化格式
# with open("/Users/andyron/myfield/github/note-exercise/Python/Python 2.7/9/test.txt", 'r') as f:
#     # print f.read()
#     # print f.read(1)
#     # print f.readline()
#     # print f.readline()
#     # print f.readlines()
#     # print f
#     for line in f.readlines():
#         print line.strip()


f = open("/Users/andyron/Pictures/1.png", "rb")

print f.read()
