# -*- coding: utf-8 -*-

from django.http import HttpResponse
from django.shortcuts import render


def hello(request):
    context = {}
    context['hello'] = 'Hello, 这是模板输出'
    context['condition1'] = True
    context['condition2'] = False
    context['condition3'] = True
    return render(request, "hello.html", context)
    # return HttpResponse("Hello World!")
