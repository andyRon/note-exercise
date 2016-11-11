import sqlite3

conn = sqlite3.connect("test.db")

cursor = conn.cursor()

cursor.execute('select * from user where id=?', ('2',))

values = cursor.fetchall()

print values

cursor.close()

conn.close()
