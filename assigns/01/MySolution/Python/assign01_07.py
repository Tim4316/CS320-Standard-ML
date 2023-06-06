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
def mylist_mergesort(xs):
    def split(xs):
        if mylist_nilq(xs):
            return (mylist_nil(), mylist_nil())
        else:
            x1 = xs.cons1
            xs_re = xs.cons2
            if mylist_nilq(xs_re):
                return (mylist_cons(x1, mylist_nil()),mylist_nil())
            else:
                x2 = xs_re.cons1
                xs_re = xs_re.cons2
                ys, ws = split(xs_re)
                return (mylist_cons(x1,ys), mylist_cons(x2,ws))


    def merge(ys, ws):
        if mylist_nilq(ys):
            return ws
        else:
            y1 = ys.cons1
            ys_re = ys.cons2
            if mylist_nilq(ws):
                return (mylist_cons(y1, ys_re))
            else:
                w1 = ws.cons1
                ws_re = ws.cons2
                if (y1 <= w1):
                    return (mylist_cons(y1, merge(ys_re, mylist_cons(w1,ws_re))))
                else:
                    return (mylist_cons(w1, merge(mylist_cons(y1, ys_re),ws_re)))

    if mylist_nilq(xs):
        return mylist_nil()
    else:
        x1 = xs.cons1
        xs_re = xs.cons2
        if mylist_nilq(xs_re):
            return mylist_cons(x1, mylist_nil())
        else:
            x2 = xs_re.cons1
            xs_re = xs_re.cons2
            ys, ws = split(xs_re)
            return merge(mylist_mergesort(mylist_cons(x1, ys)),mylist_mergesort(mylist_cons(x2, ws)))

    
