#coding=utf-8
import base64

# base64list = [];
# for x in range(65, 123):
#     base64list.append(chr(x))
base64list = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '+', '/']
base64listsafe = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '-', '_']

# print base64list[13]
# print base64.b64encode("X")
# print '\x00'

# print base64.b64encode('s13')
# print base64.b64encode('s1')
# print base64list[28], base64list[51], base64list[4], base64list[51]

# print base64list[24], base64list[16]

print base64.b64decode("QUFmdHA6Ly95Z2R5ODp5Z2R5OEB5MTUzLmR5ZHl0dC5uZXQ6OTEyMi9b0fS54rXn07B3d3cueWdkeTguY29tXS5Y1b2+r6O6zOzG9C5CRC43MjBwLrn606LLq9PvLtbQ06LLq9fWxLsubWt2Wlo=")


'''
'X'
01011000 
01011000 00000000 00000000
010110 000000 000000 000000
W A A A
WA==


'X'
01011000 
01011000  
010110 00 
W A 
WA==

图片的base64, 当图片没有一个具体地址时，
data:image/jpg;base64,
data:[][;charset=][;base64],

迅雷的地址也是这样编码的，解码以后是一个ftp地址
thunder://QUFmdHA6Ly95Z2R5ODp5Z2R5OEB5MTUzLmR5ZHl0dC5uZXQ6OTEyMi9b0fS54rXn07B3d3cueWdkeTguY29tXS5Y1b2+r6O6zOzG9C5CRC43MjBwLrn606LLq9PvLtbQ06LLq9fWxLsubWt2Wlo=

'''

