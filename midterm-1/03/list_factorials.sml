(* ****** ****** *)
use "./../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-06-06: 10 points
Please use int1_foldleft to implement
the following functions list_factorials
which, when applied to an integer n, returns
a list consisting the first n factorial numbers.
For instance, we have
list_factorials(0) = []
list_factorials(5) = [1, 1, 2, 6, 24]
list_factorials(6) = [1, 1, 2, 6, 24, 120]
PLEASE NOTE THAT YOU CANNOT DEFINE RECURSIVE
FUNCTIONS IN YOUR IMPLEMENTATION. If you do,
your implementation is disqualified.
*)

fun list_factorials(n: int): int list =
  let
    fun foldf ((fac, x, y), z) =
      if x <= n
      then (fac * x, x + 1, fac :: y)
      else (fac, x, y)
  in
    let 
      val (fac, _, y) = int1_foldleft (n, (1, 1, []), foldf)
    in 
      list_reverse y 
    end
  end
(* ****** ****** *)

(* end of [CS320-2023-Sum1-midterm1-list_factorials.sml] *)
