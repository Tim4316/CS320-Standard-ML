(* ****** ****** *)
use "./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-02-10: 20 points
Given a list of integers xs,
please implement a function that find
the longest ascending subsequences of [xs].
If there are more than one such sequences,
the left most one should be returned.
*)
fun list_filter(ys, xs) =
      case xs of
        [] => []
      | x::xs' =>
          if ys(x)
          then x :: list_filter(ys, xs')
          else list_filter(ys, xs')

fun list_longest_ascend(xs: int list): int list =
  let

    fun helper(xs: int list): int list =
      case xs of
        [] => []
      | x :: xs' =>
          let
            val i0 = helper(list_filter(fn y => y >= x, xs'))
          in
            if list_length(x :: i0) >= list_length(helper(xs'))
            then x :: i0
            else helper(xs')
          end
  in
    helper(xs)
  end

(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign02-04.sml] *)
(*use "assign02-04.sml";*)