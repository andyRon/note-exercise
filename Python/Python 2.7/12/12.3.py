
# n = 10240099
# b1 = chr((n & 0xff000000) >> 24)

# b4 = (n & 0xff)
# print b4

import struct

# print struct.pack(">I", 10240099)
# print  struct.unpack('>IH', '\xf0\xf0\xf0\xf0\x80\x80')

s = '\x42\x4d\x38\x8c\x0a\x00\x00\x00\x00\x00\x36\x00\x00\x00\x28\x00\x00\x00\x80\x02\x00\x00\x68\x01\x00\x00\x01\x00\x18\x00'
# print struct.unpack('<ccIIIIIIHH', s)


def BmpInfo(file):
    with open(file, 'rb') as f:
        con = f.read(30)
        # s = struct.unpack('<ccIIIIIIHH', con)
        # print s
        # return
        if con.find('BA') == 0: 
            print ('The file of %s is a windows bit file.' % file),
            s = struct.unpack('<ccIIIIIIHH', con)
            print ('Its size is %s bytes and it has %s colors.' %(s[2],s[9]))
        else:
            print 'The file of %s is not a bit file.' % file

# file = "/Users/andyron/Pictures/1.jpg"

# BmpInfo(file)