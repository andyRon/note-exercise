# -*- coding: UTF-8 -*-
from django.db import models

# Create your models here.

class Test(models.Model):                       # 对应`TestModel_test`表（app名_类名）
    name = models.CharField(max_length=250)     # 对应表字段`name`。CharField（相当于varchar）、DateField（相当于datetime）， max_length 参数限定长度。