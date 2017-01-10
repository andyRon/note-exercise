# -*- coding: UTF-8 -*-


"""HelloWorld URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.10/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""

# url配置文件

from django.conf.urls import url 
from django.contrib import admin
from HelloWorld.view import hello
from HelloWorld.testdb import *
from HelloWorld.search import *
urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r"^hello/$", hello),
    url(r"^testdb/$", testdb),
    url(r"^adddb/$", adddb),
    url(r"^getdb/$", getdb),
    url(r"^updatedb/$", updatedb),
    url(r"^deldb/$", deldb),
    url(r"^search/$", search),
    url(r"^search-form/$", search_form),
    url(r"^search-post/$", search_post),
]

