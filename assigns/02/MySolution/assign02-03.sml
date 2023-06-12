(* ****** ****** *)
use "./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
//
HX-2023-02-10: 10 points
The function list_tabulate takes an integer
[n] and a function [f] and returns a list that
equals [f(0), f(1), ..., f(n-1)]
//
*)

fun list_tabulate(n: int, f: int -> 'a): 'a list =
  let
    fun helper(i0: int): 'a list =
      if i0 = n then []
      else f(i0) :: helper(i0 + 1)
  in
    helper(0)
  end

(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign02-03.sml] *)
