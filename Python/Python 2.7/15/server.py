#coding=utf-8
# 服务端
import time, socket, threading
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# 监听端口: 监听127.0.0.1，客户端必须同时在本机运行才能连接
s.bind(('127.0.0.1', 9999))
# 指定等待连接的最大数量
s.listen(5)
print 'Waiting for connection...'

def tcplink(sock, addr):
    print 'Accept new connection from %s:%s...' % addr
    sock.send('Welcome!')
    while True:
        data = sock.recv(1024)
        time.sleep(1)
        if data == 'exit' or not data:
            break
        sock.send('Hello, %s!' % data)
    sock.close()
    print 'Connection from %s:%s closed.' % addr
    
while True:
    sock, addr = s.accept()
    t = threading.Thread(target=tcplink, args=(sock, addr))
    t.start()


