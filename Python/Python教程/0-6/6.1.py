# std1 = {'name':'Michael', 'score':98}
# std1 = {'name':'Andy', 'score':85}

# def print_score(std):
# 	print '%s:%s' % (std['name'], std['score'])


# class Student(object):
# 	def __init__(self, name, score):
# 		self.name = name
# 		self.score = score

# 	def print_score(self):
# 		print '%s:%s' % (self.name, self.score)

# 	def get_grade(self):
# 		if self.score > 90:
# 			return 'A'
# 		elif self.score > 70:
# 			return 'B'
# 		else:
# 			return 'C'


# andy = Student('andy', 58)
# # andy.print_score()
# # print andy.get_grade()

# michael = Student('Michael', 98)
# andy.age = 12

# print andy.age 

# michael.age 


# class Student2(Object):
# 	def __init__(self, name, score):
# 		self.__name = name
# 		self.__score = score

# 	def print_score(self):
# 		print '%s:%s' % (self.__name, self.__score)

# 	def get_name(self):
# 		return self.__name 

# 	def get_score(self):
# 		return self.__score

# 	def set_name(self, name):
# 		self.__name = name

# 	def set_score(self, score):
# 		if 0 <= score <= 100 :
# 			self.__score = score
# 		else:
# 			raise ValueError('bad score')

# jack = Student2('jack', 89)

# print jack._Student2__name

class Animal(object):
	def run(self):
		print 'Animal is running'

class Dog(Animal):
	pass

dog = Dog()
# dog.run()


import types

# print type(12)
# print type(dog)
# print type(u'abc')
# print type(int)
# print type(Dog)
# print type([])

# print type(12) == types.IntType
# print type(u'abc') == types.UnicodeType
# print type(int) == types.TypeType
# print type([]) == types.ListType

class myObject(object):
	def __len__(self):
		return 1213;

obj = myObject()
print len(obj)
		
		


