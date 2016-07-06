#coding=utf-8

# import packages.a

import sys
# print sys.modules

import cStringIO as StringIO



from PIL import Image
im = Image.open("/Users/andyron/Downloads/bash.jpg")  #录取要是完整路径
im.size
im.mode
im.format 
# im.show()		# 以临时文件打开

print sys.path