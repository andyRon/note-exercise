def isiterable(obj):
    try: 
        iter(obj)
        return True
    except TypeError:
        return False


if not isinstance(x, list) and isiterable(x):
    x = list(x)