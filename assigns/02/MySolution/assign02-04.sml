(* ****** ****** *)
use "./../../../mysmlib/mysmlib-cls.sml";
use "./../../../mysmlib/mysmlib-ind.sml";
(* ****** ****** *)

(*
HX-2023-02-10: 20 points
Given a list of integers xs,
please implement a function that find
the longest ascending subsequences of [xs].
If there are more than one such sequences,
the left most one should be returned.
*)
fun list_longest_ascend(xs: int list): int list =
  let
    fun find(xs: int list): int list =
      case xs of
        [] => []
      | x :: xs' =>
          let
            val res1 = find(list_filter (fn y => y >= x) xs')
          in
            if list_length(x :: res1) >= List.length(find(xs'))
            then x :: res1
            else find(xs')
          end
  in
    find(xs)
  end



val result = list_longest_ascend([5, 4, 3, 2, 1])
val result1 = list_longest_ascend([2, 1, 2, 1, 3, 3, 2, 2, 4, 3, 4, 5, 3, 5])
val result2 = list_longest_ascend([4, 1, 2, 1, 3, 8, 9, 5, 6, 7, 1, 1, 1, 1, 1, 1, 1])
(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign02-04.sml] *)
(*use "assign02-04.sml";*)