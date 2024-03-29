(* ****** ****** *)
use "./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
//
HX-2023-06-14: 100 points
//
Please implement a function of the name quiz02_03
that takes one list xs of integers and returns a sublist
consisting of every element in xs that is greater than all
the elements after it. For instance, if xs = [3,1,2,1,1],
then the sublist is [3,2,1]; if xs = [5,4,1,2,3], then the
sublist is [5,4,3].
//
*)

(* ****** ****** *)
(*
HX-2023-06-14:
You are not allowed to define recursive functions
to solve this problem. You can use any functions
in mysmlib.sml. If your defines recursive functions,
then it is DISQUALIFIED.
*)
(* ****** ****** *)

(*
val quiz02_03 =
fn(xs: int list) => ...
*)

(* ****** ****** *)

val quiz02_03 = fn (xs: int list) =>
  let
    fun helper(x: int, ys: int list): bool =
      list_forall (ys, fn (y: int) => x > y)
    val rev = list_reverse xs
    val (result, _) = list_foldl (rev, ([], []), fn ((ys, acc), x) =>
        if helper(x, acc)
        then (x::ys, x::acc)
        else (ys, x::acc))
  in
    result
  end

    
(* end of [CS320-2023-Sum1-quizzes-quiz02-03.sml] *)

