import sqlite3

conn = sqlite3.connect("test.db")

cursor = conn.cursor()

# sql = "create table user (id varchar(20) primary key, name varchar(20))"

# cursor.execute(sql)

sql = "insert into user (id, name) values ('2', 'andy2')"
cursor.execute(sql)

print cursor.rowcount

cursor.close()

conn.commit()
conn.close()


