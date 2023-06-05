####################################################
import sys
sys.path.append('./../..')
from assign01_lib import *
####################################################
print("[import ./../../assign01_lib.py] is done!")
####################################################
#
# Please implement (10 points)
# mylist_quicksort (see list_quicksort in assign01-lib.sml)
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


def mylist_append(xs, ys):
    if xs.ctag == 0:
        return ys
    else:
        return mylist_cons(xs.cons1, mylist_append(xs.cons2, ys))


def mylist_print(xs):
    if xs.ctag == 0:
        print("nil", end='')
    else:
        print("cons(", end='')
        print(xs.cons1, end=', ')
        mylist_print(xs.cons2)
        print(")", end='')


def mylist_quicksort(xs):
    def qsort(xs):
        if xs.ctag == 0:
            return mylist_nil()
        else:
            x1 = xs.cons1
            xs = xs.cons2
            ys, zs = qpart(xs, x1)
            ys = qsort(ys)
            zs = qsort(zs)
            return mylist_append(mylist_append(ys, mylist_cons(x1, mylist_nil())), zs)

    def qpart(xs, p0):
        if xs.ctag == 0:
            return mylist_nil(), mylist_nil()
        else:
            x1 = xs.cons1
            xs = xs.cons2
            ys, zs = qpart(xs, p0)
            if x1 <= p0:
                return mylist_cons(x1, ys), zs
            else:
                return ys, mylist_cons(x1, zs)

    return qsort(xs)