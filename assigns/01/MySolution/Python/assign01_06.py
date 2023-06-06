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
def mylist_append(xs, ys):
    if mylist_nilq(xs):
        return ys
    else:
        x1 = xs.cons1
        xs_re = xs.cons2
        return mylist_cons(x1, mylist_append(xs_re, ys))

def mylist_quicksort(xs):
    def myqsort(xs):
        if mylist_nilq(xs): 
            return mylist_nil()
        else:
            x1 = xs.cons1
            xs_re = xs.cons2
            ys, ws = qpart(xs_re, x1)
            ys = myqsort(ys) 
            ws = myqsort(ws)
            return mylist_append(mylist_append(ys, mylist_cons(x1,mylist_nil())),ws)
    def qpart(xs, a1):
        if mylist_nilq(xs): 
            return (mylist_nil(), mylist_nil())
        else:
            x1 = xs.cons1
            xs_re = xs.cons2
            ys, ws = qpart(xs_re, a1)
            if x1 <= a1: 
                return (mylist_cons(x1, ys), ws)
            else:
                 return (ys, mylist_cons(x1, ws))
    return (myqsort(xs))

