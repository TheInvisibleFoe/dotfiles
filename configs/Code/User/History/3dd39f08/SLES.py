
import numpy as np
def fd(x,h,f=f):
    y = (f(x+h) - f(x))/h
    return y
def bd(x,h,f=f):
    y = (f(x) - f(x-h))/h
    return y
def cd(x,h,f=f):
    y = (f(x +h) - f(x-h))/(2*h)
    return y

def fivept(x,h,f=f):
    y = - f(x + 2*h) + 8*f(x+h) -8*f(x-h) + f(x-2*h)
    y = y/(12 *h)
    return y


def caller(x,h,f,method):
    if method == 'fd':
        return fd(x,h,f)
    elif method == 'bd':
        return bd(x,h,f)
    elif method == 'cd':
        return cd(x,h,f)
    elif method == 'fivept':
        return fivept(x,h,f)
    else:
        print("Invalid method")
        return None