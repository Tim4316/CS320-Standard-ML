####################################################
import sys
sys.path.append('./../..')
from assign01_lib import *
####################################################
print("[import ./../assign01_lib.py] is done!")
####################################################
#
# Please implement (20 points)
# mylist_append (see list_append in assign01-lib.sml)
# mylist_rappend (see list_rappend in assign01-lib.sml)
# mylist_reverse (see list_reverse in assign01-lib.sml)
#
####################################################
def mylist_append(xs, ys):
    if mylist_nilq(xs):
        return ys
    else:
        return mylist_cons(xs.get_cons1(), mylist_append(xs.get_cons2(), ys))

def mylist_rappend(xs, ys):
    if mylist_nilq(xs):
        return ys
    else:
        return mylist_rappend(xs.get_cons2(), mylist_cons(xs.get_cons1(), ys))

def mylist_reverse(xs):
    def aux_reverse(xs, acc):
        if mylist_nilq(xs):
            return acc
        else:
            return aux_reverse(xs.get_cons2(), mylist_cons(xs.get_cons1(), acc))
    
    return aux_reverse(xs, mylist_nil())