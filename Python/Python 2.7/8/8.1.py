try:
    print 'try...'
    r = 10 / 1
    print 'result:', r
except ZeroDivisionError, e:    # ZeroDivisionError 为错误类型一定需要
    print 'except:', e
finally:
    print 'finally...'
print 'END'

