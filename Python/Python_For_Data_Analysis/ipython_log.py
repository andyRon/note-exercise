# IPython log file

img = plt.imread("ch03/stinkbug.png")
    imshow(img)
img = plt.imread("ch03/stinkbug.png")
imshow(img)
plot(randn(1000).cumsum())
randn(1000).cumsum()
get_ipython().magic(u'page randn(1000).cumsum()')
_
_i1
_i8
__
_i3
foo = 'bar'
foo
_i27
_i13
exec _i13
get_ipython().magic(u'logstate')
get_ipython().magic(u'logstart')
get_ipython().magic(u'll ')
less ipython_log.py
get_ipython().magic(u'logstate')
get_ipython().magic(u'pinfo %logon')
get_ipython().magic(u'dirs')
get_ipython().magic(u'll ')
get_ipython().magic(u'env')
get_ipython().magic(u'cd ')
get_ipython().magic(u'll ')
get_ipython().magic(u'cd -')
get_ipython().magic(u'dhist')
get_ipython().magic(u'env')
get_ipython().magic(u'run ch03/ipython_bug.py')
get_ipython().magic(u'debug')
get_ipython().magic(u'll ')
get_ipython().magic(u'run -d  ch03/ipython_bug.py')
get_ipython().magic(u'run ch03/ipython_bug.py')
get_ipython().magic(u'debug')
get_ipython().magic(u'run -d chq')
get_ipython().magic(u'run -d ch03/ipython_bug.py')
get_ipython().magic(u'run -d ch03/ipython_bug.py')
get_ipython().magic(u'run -d ch03/ipython_bug.py')
get_ipython().magic(u'pwd ')
get_ipython().magic(u'll ')
get_ipython().magic(u'run ch03/ipython_bug.py')
get_ipython().magic(u'debug')
strings = ['foo', 'foobar', 'baz', 'qux', 'python', 'Guido Van Rossum'] * 100000
strings
get_ipython().magic(u'll ')
get_ipython().magic(u"time method1 = [x for x in strings if x.startwith('foo')]")
get_ipython().magic(u"time method1 = [x for x in strings if x.startswith('foo')]")
get_ipython().magic(u"time method2 = [x for x in strings if x[:3] == 'foo']")
method1
get_ipython().magic(u"timeit method2 = [x for x in strings if x[:3] == 'foo']")
get_ipython().magic(u"time method1 = [x for x in strings if x.startswith('foo')]")
get_ipython().magic(u"timeit method1 = [x for x in strings if x.startswith('foo')]")
get_ipython().magic(u"timeit method2 = [x for x in strings if x[:3] == 'foo']")
get_ipython().magic(u"timeit method1 = [x for x in strings if x.startswith('foo')]")
x = 'foobar'
y = 'foo'
get_ipython().magic(u'timeit x.startswith(y)')
get_ipython().magic(u'timeit x[:3] == y')
xrange(10)
for i in xrange(10):
    print i
    
for i in xrange(100):
    print i
    
    
exit()
