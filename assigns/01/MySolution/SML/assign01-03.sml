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
    fun helper(xs: 'a xlist, reverse: bool): 'a xlist =
      case xs of
        xlist_nil => xlist_nil
      | xlist_cons(x, xs) =>
        if reverse then
          xlist_snoc(helper(xs, true), x)
        else
          xlist_cons(x, helper(xs, false))
      | xlist_snoc(xs, x) =>
        if reverse then
          xlist_cons(x, helper(xs, true))
        else
          xlist_snoc(helper(xs, false), x)
      | xlist_append(xs1, xs2) =>
        if reverse then 
          xlist_append (helper(xs2, true), helper (xs1, true))
        else 
          xlist_append (helper(xs1, false), helper(xs2, false))
      | xlist_reverse(xs) =>
        helper(xs, not reverse)
  in
    helper(xs, false)
  end
(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign01-03.sml] *)
