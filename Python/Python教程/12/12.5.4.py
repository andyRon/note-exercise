import itertools 

natuals = itertools.count(1)
ns = itertools.takewhile(lambda x: x <=10, natuals)
for n in ns:
    print n