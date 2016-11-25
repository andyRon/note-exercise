import geocoder
g = geocoder.arcgis(u"上海")
dir(g)
help(g.y)
help(g)
g.street
type(g)
type(g.street)
l = [2,34,5]
type(l)
isinstance(l, list)
l = [12,"a"]
l
s = {"a":1}
s
type(s)
ll
ll
pwd
ls
ll
g.ok
g.latl
g.latlng
type([])
frozenset
help("frozenset")
f = frozenset()
f.difference
f.difference()
d = {"a":1,"b":2}
d.has_key
d.has_key()
d.has_key(1)
d.has_key("a")
hash(d)
hash(d.a)
d["a"]
hash(d["a"])
import tushare
import numpy as np
np.abs(-12)
1.
4e+210
4.0e+210
4.0e+2
4e+2
0o177
8*8 + 7*8 + 7
0O177
3j
bin(123214)
bin(123123)
hex(1231)
oct(123)
int("123123", 8)
int("123123", 3)
int("123123", 2)
int("123123", 16)
help("int")
int()
float('inf')
1 is 2
l
s
l is s
l and s
1 and 2
1 || 2
1/3
1 // 3
/
a
a = 2
a.bit_length()
a = 1.24
a = 1024
a.bit_length()
a = 3
a.bit_length()
a = 4
a.bit_length()
help("bit_length")
import decimal
decimal("0.2")
from decimal import Decimal
Decimal("0.23")
Decimal("0.23") + Decimal("0.232")
0.23+0.232
from fractions import Fraction
s = set()
s
s = set([23,234234,45,88,9])
2 in s
23 in s
s2 = set([23,23])
len(s2)
s
s2
s | s2
s & s2
s.union(s2)
s.intersection(s2)
s - s2
s2 - s
s2
s1 = set(1,2,3,4)
s1 = set({1,2,3,4})
s1
s2 = set({2,3,5,7})
s2
s1 - s2
s.update([8])
s
s1.update([8])
s1
{x**2 for x in s1}
help("issubset")
s1.issubset("2")
s1
s2
s3 = set([1,2,3,4,8,9])
s1.issubset(s2)
s1.issubset(s3)
s1 < s2
s1 <= s2
s1 <= s3
s1.copy()
s1.copy()
s
s.clear()
s
s.discard(2)
print s.discard(2)
s1.discard(8)
s1
import numpy
s1
b = s1
b
s1.update([22])
s1
b
get(b, "split")
getattr(b, "split")
a = 1
getattr(a, "split")
a = "foo"
getattr(a, "split")
getattr(a, "spli")
iter(a)
pwd
cd myfield/github/note-exercise/Python/Python_For_Data_Analysis/
ll
%run
ll
%run Python语言精要.py
%run Python语言精要.py
isiterable("asdf")
2**4
ll
pwd
pwd ~
ll ~
ll ~/myfield
ll ~/myfield/books
ll
path = "/Users/andyron/myfield/books/pydata-book-master/ch02/usagov_bitly_data2012-03-16-1331923249.txt"
path
open(path).readline()
import json
records = [json.loads(line) for line in open(path)]
records
pwd
ll
%hist -f "ipython-hist.py"
pwd
ll
%hist -f ipython-hist.py
