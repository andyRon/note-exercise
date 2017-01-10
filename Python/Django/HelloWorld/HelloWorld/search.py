# -*- coding: utf-8 -*-

from django.http import HttpResponse
from django.shortcuts import render_to_response
from django.shortcuts import render

# csrf一直有问题
# from django.core.context_processors import csrf
# from django.middleware import csrf


# 表单
def search_form(request):
    return render_to_response('search_form.html')

# 接收请求数据
def search(request):  
    request.encoding='utf-8'
    if 'q' in request.GET:
        message = '你搜索的内容为: ' + request.GET['q'].encode('utf-8')
    else:
        message = '你提交了空表单'
    return HttpResponse(message)


# 接收POST请求数据
def search_post(request):
    ctx ={}
    # ctx.update(csrf(request)) 
    if request.POST:
        ctx['rlt'] = request.POST['q']
    return render(request, "post.html", ctx)