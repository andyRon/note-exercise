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
			a, b = b, a+b
			print b
		
		n = n + 1

# fib(7)

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
print f_g.next()
print f_g.next()
print f_g.next()
print f_g.next()

