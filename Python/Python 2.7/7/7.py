#coding=utf-8

class Student(object):
    pass

a = Student() 
a.name = 'andy'
a.weight = 70


# print(a.name)

def set_age(self, age):
    self.age = age 

from types import MethodType

a.set_age = MethodType(set_age, a, Student)  # 给是实例a添加一个 set_age 的方法

a.set_age(25)

# print(a.age)
s = Student()
# s.set_age(20)

Student.set_age = MethodType(set_age, None, Student) # 为所有实例绑定

s.set_age(20)
# print(s.age)


class Student2(object):
    __slots__ = ('name', 'age')

s2 = Student2()
# s2.weight = 75

class GraduateStudent(Student2):
    pass

s3 = GraduateStudent()
s3.weight = 70
# print(s3.weight)






