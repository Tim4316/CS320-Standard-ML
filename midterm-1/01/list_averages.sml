(* ****** ****** *)
use "./../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
(*
int2real
coerces an int into a real:
*)
val int2real = Real.fromInt
(* ****** ****** *)
(*
HX-2023-03-01: midterm1-01: 10 points
*)
(* ****** ****** *)
(*
Given a list of reals xs, list_averages(xs)
returns another list ys of reals such that:
ys[0] = xs[0] / 1.0
ys[1] = (xs[0] + xs[1]) / 2.0
ys[2] = (xs[0] + xs[1] + xs[2]) / 3.0
In general, ys[i] is the average of the first
(i+1) elements in xs.
//
For instance,
list_averages([]) = []
list_averages([1.0,2.0,3.0]) = [1.0,1.5,2.0]
list_averages([1.0,2.0,3.0,4.0]) = [1.0,1.5,2.0,2.5]
//
Note that you are allowed to define recursive
functions in your implementation of list_averages.
//
*)
(* ****** ****** *)

fun list_averages(xs: real list): real list =
  let
    fun loop([], _, ys) = ys
      | loop(x::xs, sum, ys) =
        let
          val new_sum = sum + x
          val new_average = new_sum / real(length ys + 1)
        in
          loop(xs, new_sum, ys @ [new_average])
        end
  in
    loop(xs, 0.0, [])
  end

val result = list_averages([])
val result1 = list_averages([1.0,2.0,3.0])
val result2 = list_averages([1.0,2.0,3.0,4.0])


(* ****** ****** *)

(* end of [CS320-2023-Sum1-midterm1-list_averages.sml] *)
