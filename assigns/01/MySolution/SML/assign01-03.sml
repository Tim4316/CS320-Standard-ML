(* ****** ****** *)

use "./../../assign01-lib.sml";

(* ****** ****** *)

(*
//
Assign01-03: 10 points
//
Please implement a function that converts a given
xlist 'xs' into another xlist 'ys' by removing the
constructor 'xlist_reverse':
//
fun xlist_remove_reverse(xs: 'a xlist): 'a xlist
//
In particular, your implementation should guarantee:
1. 'xs' and 'ys' represent the same list
2. 'ys' does NOT make any use of 'xlist_reverse'
3. 'xs' and 'ys' use the same number of 'xlist_append'
//
*)
  
(* ****** ****** *)

fun
xlist_remove_reverse
(xs: 'a xlist): 'a xlist = raise NotImplemented320

fun xlist_remove_reverse(xs: 'a xlist): 'a xlist =
  let
    fun removeReverseHelper(xs: 'a xlist, acc: 'a xlist): 'a xlist =
      case xs of
        xlist_nil => acc
      | xlist_cons(x, xs') => removeReverseHelper(xs', xlist_cons(x, acc))
      | xlist_snoc(xs', x) => removeReverseHelper(xs', xlist_snoc(acc, x))
      | xlist_append(xs1, xs2) =>
          let
            val ys1 = removeReverseHelper(xs1, xlist_nil)
            val ys2 = removeReverseHelper(xs2, xlist_nil)
          in
            xlist_append(ys1, ys2)
          end
      | xlist_reverse(xs') => removeReverseHelper(xs', acc)
  in
    removeReverseHelper(xs, xlist_nil)
  end
(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign01-03.sml] *)
