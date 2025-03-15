import numpy as np


        
class diff_eq:
        
    def euler(y,x,h,f):
        yn = y +f(x,y)*h
        return yn
        
        

    def midpoint(y,x, h, f):
        k1 = h * f(x, y)
        return y + h * f(x + h / 2, y + k1 / 2)

    def rk4(y,x,h,f):
        k1 = h*f(x,y)
        k2 = h*f(x+h/2,y+k1/2)
        k3 = h*f(x+h/2,y+k2/2)
        k4 = h*f(x+h,y+k3)
        y_n = y + (k1+2*k2+2*k3+k4)/6
        return y_n

    def vlt(yn, ym1, xn, h , f):
        yn = 2*yn - ym1 + f(xn, yn)*h**2
        return yn

    def vel_vlt(yn, vn, x, h , f):
        ynp1 = yn + vn*h + 0.5*f(x, yn)*(h**2)
        vnp1 = vn + 0.5*(f(x, yn) + f(x + h, ynp1))*h
        return ynp1, vnp1

    def call(meth,a,b,N,y0,f): # call function Discretizes and generates method
        h = (b-a)/(N-1)
        ys = np.zeros((N, len(y0)))
        y,ys[0] = y0,y0
        xs = np.arange(a,b+h/2,h)
        for i in range(N):
            ys[i,:] = y # to allow for vector solutions
            y = meth(y,xs[i],h,f)
        return ys

    def call_verlet(a,b,N,y0, v0,f):
        h = (b-a)/(N-1)
        ys = np.zeros((N, len(y0)))
        xs = np.arange(a,b+h/2,h)

        ys[0] = y0

        x0 = xs[0]

        ys[1] = y0 + v0*h + 0.5*f(x0, y0)*(h**2)
        
        y = ys[1]
        for i in range(1,N):
            ys[i,:] = y # to allow for vector solutions
            y = vlt(ys[i], ys[i-1],xs[i],h,f)
        return ys

    def call_vvlt(meth,a,b,N,y0,v0, f):
        h = (b-a)/(N-1)
        ys = np.zeros((N, len(y0)))
        xs = np.arange(a,b+h/2,h)
        vs = np.zeros((N, len(v0)))
        y,ys[0] = y0,y0
        x0 = xs[0]
        v,vs[0] = v0,v0
        for i in range(N):
            ys[i,:] = y # to allow for vector solutions
            vs[i,:] = v
            [y,v] = meth(ys[i], vs[i],xs[i],h,f)
        return ys, vs