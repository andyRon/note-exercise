#coding=utf-8
# 客户端

import socket

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

s.connect(('127.0.0.1', 9999))

print s.recv(1024)

for data in ['Andy', 'Tom', 'Michael']:
    s.send(data)
    print s.recv(1024)

s.send('exit')
s.close()