def application(environ, start_response):
    start_response('200 OK', [('Content-Type', 'text/html')])
    # return  environ
    return '<h1>Hello, %s!</h1>' % (environ['PATH_INFO'][1:] or 'web')