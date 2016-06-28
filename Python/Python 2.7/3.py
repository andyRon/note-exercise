L = ['Michael', 'Sarah', 'Tracy', 'Bob', 'Jack']

# print L[0:3]

d = {'a': 1, 'b': 2, 'c': 3}
for k in d:
	print k


for k, v in d.iteritems():
	print k, v

for v in d.itervalues():
	print v


import os

print [d for d in os.listdir(".")]