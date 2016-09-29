#coding=utf-8


# try:
#     print 'try...'
#     r = 10 / 1
#     print 'result:', r
# except ZeroDivisionError, e:    # ZeroDivisionError 为错误类型一定需要
#     print 'except:', e
# finally:
#     print 'finally...'
# print 'END'


class FooError(StandardError):
    pass 

def foo(s):
    n = int(s)
    if n == 0:
        raise FooError("invalid value: %s" % s)
    return 10/n

foo(0)

