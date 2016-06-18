def my_abs(x):
	if not isinstance(x, (int, float)):
		raise TypeError("bad operand type")
	if x>=0:
		return x
	else: 
		return -x



# print my_abs("A")

import math

def move(x, y, step, angle):
	dx = x + step * math.cos(angle)
	dy = y + step * math.sin(angle)
	return dx, dy

x, y = move(100, 100, 60, math.pi/6)
# print x, y



def power(x, n=2):
	s = 1
	while n > 0:
		n = n -1
		s = s * x

	return s

print power(2, 5)