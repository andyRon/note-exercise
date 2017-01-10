#coding=utf-8

def fn(x):
	return x*x

l = range(8)

# print map(fn, l)

# print str(12)

def add(x, y):
	return x + y;

# print reduce(add, range(5))



def fn2(x, y):
	return x*10 + y


# print reduce(fn2, [1, 3, 5, 7, 2])

# print reduce(fn2, [23, 56])

def char2num(s):
	return {'0':0, '1':1, '2':2, '3':3, '4':4, '5':5, '6':6, '7':7, '8':8, '9':9}[s]

def str2int(str):
	return reduce(fn2, map(char2num, str))

# print str2int("1254629347")

def str2int(str):
	return reduce(lambda x,y: x*10 +y, map(char2num, str))

# print str2int("143434")
def format(str):
	return str[0].upper() + str[1:].lower()

def lianxi_1(l):
	return map(format, l)

# print lianxi_1(['adam', 'LISA', 'barT'])

def pro(l):
	return reduce(lambda x,y: x*y, l)


# print pro([2,5,5,6])

def is_odd(i):
	return i % 2 == 1

# print filter(is_odd, [1,2,3,4,5,6,7])

def is_sushu(n):
	i = 2
	while i < n:
		if n % i == 0:
			return False
		i = i + 1

	return True
# print filter(is_sushu, range(100)[1:])

def cmp_ignore_case(s1, s2):
	u1 = s1.upper()
	u2 = s2.upper()
	if (u1 > u2):
		return 1;
	if (u1 < u2):
		return -1;
	return 0;

# print sorted(['Dfc', 'dfc', 'adb', 'aDBf', 'Afcd'], cmp_ignore_case)

#当 f1,f2,f3执行时，他们的共同参数i的值都是3
def count():
    fs = []
    for i in range(1, 4):
        def f():
             return i*i
        fs.append(f)
    return fs

# f1, f2, f3 = count()

# print f1(), f2(), f3()

def count_v2():
	fs = []
	for i in range(1, 4):
		def f(j):
			def k():
				return j*j
			return k
		fs.append(f(i))
	return fs

# f1, f2, f3 = count_v2()

# print f1(), f2(), f3()

def log(func):
    def wrapper(*args, **kw):
        print 'call %s():' % func.__name__
        return func(*args, **kw)
    return wrapper

@log		# 把@log放到now()函数的定义处，相当于执行了语句：`now = log(now)`
def now():
    print '2013-12-25'

# now()

def log_v2(text):
	def decorator(func):
		def wrapper(*args, **kw):
			print '%s %s():' % (text, func.__name__)
			return func(*args, **kw)
		return wrapper
	return decorator

@log_v2('execute')		# 相当于执行了语句: `now_v2 = log_v2('execute')(now_v2)`
def now_v2():
	print '2016-07-06 16:52:12'

# now_v2()


import functools

# print int('123', base=16)

def int2(x):
	return int(x, base=2)

# print int2("101010110")

int2_v2 = functools.partial(int, base=2)

# print int2_v2("10111")

# print max(5,6,7, [10,12])

max2 = functools.partial(max, 10)

# print max2(5, 6, 7)





