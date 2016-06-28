def my_abs(x):
	if not isinstance(x, (int, float)):
		raise TypeError("bad operand type")
	if x>=0:
		return x
	else: 
		return -x



# print my_abs("A")

import math

def move(x, y, step, angle):
	dx = x + step * math.cos(angle)
	dy = y + step * math.sin(angle)
	return dx, dy

x, y = move(100, 100, 60, math.pi/6)
# print x, y



def power(x, n=2):
	s = 1
	while n > 0:
		n = n -1
		s = s * x

	return s

# print power(2, 5)

def calc(*numbers):
	sum = 0
	for n in numbers:
		sum = sum + n*n
	return sum

# print calc(1,2,4,5)

def person(name, age, **other):
	print 'name:', name, 'age:', age, 'other:', other

# person('andy', 25, location="shanghai", weight="70")

kw = {'city': 'Beijing', 'job': 'Engineer'}
# person('Jack', 24, **kw)


def func(a, b, c=0, *args, **kw):
	print 'a:', a, 'b:', b, 'c:', c, 'args:', args, 'kw:', kw 

# func(1, 3, 4, 5, 6, 23)
# func(1, 3, 4, 5, 6, ab=23)
args = (12, 5, 6, 7)
kw = {"key1": 90, 'x': 999}
# func(*args, **kw)


def recur(n):
	if (n <= 1):
		return 1
	else: 
		return n * recur(n-1)

# print recur(100) 

def fact(n):
    return fact_iter(n, 1)

def fact_iter(num, product):
    if num == 1:
        return product
    return fact_iter(num - 1, num * product)
# print fact(998)





