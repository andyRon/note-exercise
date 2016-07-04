
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


print pro([2,5,5,6])
