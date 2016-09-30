from collections import namedtuple

Point = namedtuple("point", ['x', 'y'])

p = Point(1, 3)

# print p

# pp = (2, 3, 2)
# print pp

from collections import deque 

q = deque(['a', 'b', 'c'])
q.append('x')
q.appendleft('l')

# print q

from collections import defaultdict

d = defaultdict(lambda: 'N/A')
d['key1'] = 'a'

# print d['key1']
# print d['k']

from collections import OrderedDict

d = {"key2":2, "key1":1, "key3":3}
print d.keys()

od = OrderedDict()
od['key2'] = 2
od['key1'] = 1
od['key3'] = 3
print od.keys()


# ???
class LastUpdatedOrderedDict(OrderedDict):

    def __init__(self, capacity):
        super(LastUpdatedOrderedDict, self).__init__()
        self._capacity = capacity

    def __setitem__(self, key, value):
        containsKey = 1 if key in self else 0
        if len(self) - containsKey >= self._capacity:
            last = self.popitem(last=False)
            print 'remove:', last
        if containsKey:
            del self[key]
            print 'set:', (key, value)
        else:
            print 'add:', (key, value)
        OrderedDict.__setitem__(self, key, value)