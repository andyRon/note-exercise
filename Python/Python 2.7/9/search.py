#coding=utf-8
# 搜索当前目录下对应名的目录和文件

import os
import sys 

def search(s, curdir):
    for x in os.listdir(curdir):
        if x.find(s) != -1:
            print x
            if os.path.isdir(x):
                search(s, os.path.join(curdir, x))

if __name__ == '__main__':
    curdir = os.path.realpath('.')
    search(sys.argv[1], curdir)
    
