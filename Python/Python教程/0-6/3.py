# -*- coding: utf-8 -*- 

L = ['Michael', 'Sarah', 'Tracy', 'Bob', 'Jack']

# print L[0:3]

# d = {'a': 1, 'b': 2, 'c': 3}
# for k in d:
# 	print k


# for k, v in d.iteritems():
# 	print k, v

# for v in d.itervalues():
# 	print v


# import os

# print [d for d in os.listdir(".")]

# g = (x*x for x in range(10))

# print g
# print g.next()
# for n in g:
# 	print n

def fib(max):
	n, a, b = 0, 1, 1
	while n < max:
		if n < 2:
			print 1
		else:
			a, b = b, a+b 		# tuple的简写形式
			print b
		
		n = n + 1

# fib(7)

# 函数是顺序执行，遇到return语句或者最后一行函数语句就返回。而变成generator的函数，在每次调用next()的时候执行，遇到yield语句返回，再次执行时从上次返回的yield语句处继续执行
def fib_g(max):
	n, a, b = 0, 1, 1
	while n < max:
		if n < 2:
			yield 1
		else:
			a, b = b, a+b
			yield b
		
		n = n + 1

f_g = fib_g(4)
# print f_g.next()
# print f_g.next()
# print f_g.next()
# print f_g.next()

# def triangles():
# 	row = 1
# 	l = [1,1]
# 	if row == 1:
# 		row = row + 1
# 		yield [1]
# 	elif row == 2:
# 		yield [1,1]
# 	else:
# 		n = 0
# 		L = range(num+1)
# 		while n <= num:
# 			if n == 0:
# 				L[n] = l[n]
# 			elif n == num:
# 				L[n] = l[n-1]
# 			else :
# 				L[n] = l[n-1] + l[n]
# 			n = n + 1
# 		l = L 
# 		yield l

# 杨辉三角
def triangles():
    L = [1]
    while True:
        yield L
        L.append(0)
        L = [L[i - 1] + L[i] for i in range(len(L))]	


n = 0
for t in triangles():
    print(t)
    n = n + 1
    if n == 10:
        break





	



