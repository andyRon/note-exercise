# codding=utf-8

from bs4 import BeautifulSoup

soup = BeautifulSoup(open("index.html"))

# print soup.prettify()

# print soup.title
# print soup.head
# print soup.a
# print soup.p
# print type(soup.a)

# print soup.name
# print soup.a.name
# print soup.a.attrs
# print soup.a['href']
# print soup.a.get("id")

# soup.a['id'] = "link4"

# print soup.p.string
# print type(soup.p.string)

# print type(soup)

# print type(soup.a.string)
# print soup.a.string

# print soup.body.contents

# print soup.head.children
# for child in soup.body.children:
# 	print child

# for child in soup.body.descendants:
# 	print child

# for child in soup.p.strings:
# 	print child

# for child in soup.p.stripped_strings:
# 	print child

# print soup.p.parent.name

# content = soup.head.title.string 
# for parent in content.parents:
# 	print parent.name

# print soup.find_all('a')

import re 

# for tag in soup.find_all(re.compile("^b")):
# 	print tag.name


# for tag in soup.find_all():
# 	print tag.name


# for tag in soup.find_all(['a', 'b']):
# 	print tag.name 

# def has_class_but_no_id(tag):
# 	return tag.has_attr("class") and not tag.has_attr('id')

# for tag in soup.find_all(has_class_but_no_id):
# 	print tag.name

# print soup.find_all(id="link1", href=re.compile("elsie"))

# print soup.find_all("a", class_="sister2")

# print soup.find_all(attrs={"data-foo": "sister"})

# print soup.find_all(text=re.compile("Dormouse"))
# print soup.find_all("a", limit=1)

print soup.html.find_all("title")
print soup.html.find_all("title", recursive=False)