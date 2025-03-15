def euler(y,x,h,f):
    yn = y +f(x,y)*h
    return yn
def midpoint(y,x, h, f):
    k1 = h * f(x, y)
    return y + h * f(x + h / 2, y + k1 / 2)
def rk4(y,x,h,f=f1):
    k1 = h*f(x,y)
    k2 = h*f(x+h/2,y+k1/2)
    k3 = h*f(x+h/2,y+k2/2)
    k4 = h*f(x+h,y+k3)
    y_n = y + (k1+2*k2+2*k3+k4)/6
    return y_n

def call(meth,a,b,N,y0,f): # call function Discretizes and generates method
    h = (b-a)/(N-1)
    ys = np.zeros((N, len(y0)))
    y,ys[0] = y0,y0
    xs = np.arange(a,b+h/2,h)
    for i in range(N):
        ys[i,:] = y # to allow for vector solutions
        y = meth(y,xs[i],h,f)
    return ys
