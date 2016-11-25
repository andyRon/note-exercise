django 使用 (http://www.runoob.com/django/django-first-app.html)
--------------------

### 安装
- mac `sudo pip install django`

### 创建项目
- `django-admin.py startproject HelloWorld`    django-admin.py是安装django后的命令.  生成HelloWorld的目录
- HelloWorld的目录结构说明
    + HelloWorld: 项目的容器。
    + manage.py: 一个实用的命令行工具，可让你以各种方式与该 Django 项目进行交互。
    + HelloWorld/__init__.py: 一个空文件，告诉 Python 该目录是一个 Python 包。
    + HelloWorld/settings.py: 该 Django 项目的设置/配置。
    + HelloWorld/urls.py: 该 Django 项目的 URL 声明; 一份由 Django 驱动的网站"目录"。
    + HelloWorld/wsgi.py: 一个 WSGI 兼容的 Web 服务器的入口，以便运行你的项目。
- 启动服务器 `python manage.py runserver 0.0.0.0:8000`
- 浏览器访问  http://127.0.0.1:8000/
- 视图和 URL 配置
    +
