####################################################
import sys
sys.path.append('./../..')
from assign01_lib import *
####################################################
print("[import ./../../assign01_lib.py] is done!")
####################################################
#
# Please implement (20 points)
# mylist_mergesort (see list_mergesort in assign01-lib.sml)
#
####################################################
class MyList:
    def __init__(self, ctag, cons1=None, cons2=None):
        self.ctag = ctag
        self.cons1 = cons1
        self.cons2 = cons2


def mylist_nil():
    return MyList(0)


def mylist_cons(x, xs):
    return MyList(1, x, xs)


def mylist_print(xs):
    if xs.ctag == 0:
        print("nil", end='')
    else:
        print("cons(", end='')
        print(xs.cons1, end=', ')
        mylist_print(xs.cons2)
        print(")", end='')


def mylist_mergesort(xs):
    def split(xs):
        if xs.ctag == 0:
            return mylist_nil(), mylist_nil()
        else:
            x1 = xs.cons1
            xs = xs.cons2
            if xs.ctag == 0:
                return mylist_cons(x1, mylist_nil()), mylist_nil()
            else:
                x2 = xs.cons1
                xs = xs.cons2
                ys, zs = split(xs)
                return mylist_cons(x1, ys), mylist_cons(x2, zs)

    def merge(ys, zs):
        if ys.ctag == 0:
            return zs
        elif zs.ctag == 0:
            return ys
        else:
            y1 = ys.cons1
            ys = ys.cons2
            z1 = zs.cons1
            zs = zs.cons2
            if y1 <= z1:
                return mylist_cons(y1, merge(ys, mylist_cons(z1, zs)))
            else:
                return mylist_cons(z1, merge(mylist_cons(y1, ys), zs))

    if xs.ctag == 0:
        return mylist_nil()
    else:
        x1 = xs.cons1
        xs = xs.cons2
        if xs.ctag == 0:
            return mylist_cons(x1, mylist_nil())
        else:
            x2 = xs.cons1
            xs = xs.cons2
            ys, zs = split(xs)
            return merge(mylist_mergesort(mylist_cons(x1, ys)), mylist_mergesort(mylist_cons(x2, zs)))
