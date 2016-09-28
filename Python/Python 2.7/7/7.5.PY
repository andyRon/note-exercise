class Hello(object):
    def hello(self, name='world'):
        print('Hello, %s.' % name)

h = Hello()

print type(Hello)
print type(h)
