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
    +  新建`view.py` 
    ```
    from django.http import HttpResponse

    def hello(request):
        return HttpResponse("Hello World!")

    ```
    + 修改`urls.py`。当访问`http://127.0.0.1:8000/hello`就是访问函数hello了
    ```
    from django.conf.urls import url 
    from django.contrib import admin
    from HelloWorld.view import hello

    urlpatterns = [
        url(r'^admin/', admin.site.urls),
        url(r"^hello/$", hello)
    ]
    ```

### Django 模板


### Django 模型
- Django 为这些数据库(PostgreSQL、MySQL、SQLite、Oracle)提供了统一的调用API
- 数据库配置，在settings.py 文件中找到 DATABASES 配置项
```
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',  # 或者使用 mysql.connector.django
        'NAME': 'test',
        'USER': 'test',
        'PASSWORD': 'test123',
        'HOST':'localhost',
        'PORT':'3306',
    }
}
```

- 定义模型
    + 创建一个app `python manage.py startapp TestModel`。 TestModel目录的结构：
    ```
    $ tree TestModel/
    TestModel/
    ├── __init__.py
    ├── admin.py
    ├── apps.py
    ├── migrations
    │   └── __init__.py
    ├── models.py
    ├── tests.py
    └── views.py
    ```
    + 修改 TestModel/models.py文件
    ```
    # -*- coding: UTF-8 -*-
    from django.db import models

    # Create your models here.

    class Test(models.Model):                       # 对应`TestModel_test`表（app名_类名）
        name = models.CharField(max_length=250)     # 对应表字段`name`。CharField（相当于varchar）、DateField（相当于datetime）， max_length 参数限定长度。
    ```

    + 在settings.py中找到INSTALLED_APPS这一项：
    ```
    INSTALLED_APPS = (
        'django.contrib.admin',
        'django.contrib.auth',
        'django.contrib.contenttypes',
        'django.contrib.sessions',
        'django.contrib.messages',
        'django.contrib.staticfiles',
        'TestModel',               # 添加此项
    )
    ```
- 数据库操作
    + 在 HelloWorld 目录中添加 testdb.py 文件，并修改urls.py：
    ```
    from django.conf.urls import url 
    from django.contrib import admin
    from HelloWorld.view import hello
    from HelloWorld.testdb import testdb

    urlpatterns = [
        url(r'^admin/', admin.site.urls),
        url(r"^hello/$", hello),
        url(r"^testdb/$", testdb),
    ]
    ```

### Django 表单
csrf有问题 ？？

### Django Admin 管理工具
？？





### [Django 1.8.2 文档](http://python.usyiyi.cn/translate/django_182/intro/overview.html)