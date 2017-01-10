import hashlib

md5 = hashlib.md5()
md5.update('how to use md5 in python hashlib?')
print md5.hexdigest()

md5.update('how to use md5 in ')
md5.update('python hashlib?')
print md5.hexdigest()

sha1 = hashlib.sha1()
sha1.update('how to use sha1 in ')
sha1.update('python hashlib?')
print sha1.hexdigest()

sha512 = hashlib.sha512()
sha512.update('how to use sha1 in ')
sha512.update('python hashlib?')
print sha512.hexdigest()