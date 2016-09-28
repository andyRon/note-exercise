#coding=utf-8

class Student(object):
    def __init__(self, name):
        self.name = name

# print Student("Andy")
# <__main__.Student object at 0x10e525850>

class Student2(object):
    def __init__(self, name):
        self.name = name
    def __str__(self):
        return 'Student object (name: %s)' % self.name

# print Student2("AndyRon")
# Student object (name: AndyRon)

s = Student('Michael')

class Student3(object):
    def __init__(self, name):
        self.name = name
    def __str__(self):
        return 'Student object (name=%s)' % self.name
    __repr__ = __str__


class Fib(object):
    def __init__(self):
        self.a, self.b = 0, 1 # 初始化两个计数器a，b

    def __iter__(self):
        return self # 实例本身就是迭代对象，故返回自己

    def next(self):
        self.a, self.b = self.b, self.a + self.b # 计算下一个值
        if self.a > 100000: # 退出循环的条件
            raise StopIteration();
        return self.a # 返回下一个值

# for n in Fib():
#      print n


class Fib2(object):
    def __getitem__(self, n):
        a, b = 1, 1
        for x in range(n):
            a, b = b, a + b
        return a
f = Fib2()
# print f[100]

class Fib3(object):
    def __getitem__(self, n):
        if isinstance(n, int):
            a, b = 1, 1
            for x in range(n):
                a, b = b, a + b
            return a
        if isinstance(n, slice):
            start = n.start
            stop = n.stop
            a, b = 1, 1
            L = []
            for x in range(stop):
                if x >= start:
                    L.append(a)
                a, b = b, a + b
            return L

f = Fib3()
# print f[1:11]

class Student4(object):
    def __getattr__(self, attr):
        if attr == 'age':
            return lambda: 28
        if attr == 'weight':
            return 70

s = Student4()
# print s.age()
# print s.weight
# print s.name    # None

class Chain(object):

    def __init__(self, path=''):
        self._path = path

    def __getattr__(self, path):
        return Chain('%s/%s' % (self._path, path))

    def __str__(self):
        return self._path
# print Chain().status
# print Chain().status.user.timeline.list
