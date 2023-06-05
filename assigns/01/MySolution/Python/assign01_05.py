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
def mylist_nil():
    return []

def mylist_cons(x, xs):
    return [x] + xs

def mylist_size(xs):
    return len(xs)

def mylist_print(xs):
    print(xs)

def mylist_append(xs, ys):
    if not xs:
        return ys
    else:
        return [xs[0]] + mylist_append(xs[1:], ys)

def mylist_rappend(xs, ys):
    if not xs:
        return ys
    else:
        return mylist_rappend(xs[1:], [xs[0]] + ys)

def mylist_reverse(xs):
    return mylist_rappend(xs, [])