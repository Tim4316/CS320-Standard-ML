(* ****** ****** *)

use
"./../../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

(*
//
// HX-2023-04-20: 20 points
//
Given a stream fxs of real numbers a0, a1, a2, ...
and a real number x0, stream_evaluate(fxs, x0)
returns another stream of real number that enumerates
all of the following partial sums:
a0, a0 + a1*x0, a0 + a1*x0 + a2*x0^2, ...
The general form of the enumerated sums is given as follows
(a0 + a1*x0 + a2*x0^2 + ... + an * x0^n)
*)

(* ****** ****** *)

(*
fun
stream_evaluate
( fxs
: real
  stream
, x0: real): real stream = ...
*)

fun stream_evaluate(fxs: real stream, x0: real): real stream = fn() =>
  let
    fun helper(n, fxs, sum, pow) =
      case fxs() of
        strcon_nil => strcon_nil
        | strcon_cons(hd, tl) =>
        let
          val new_sum = sum + hd * pow
        in
          strcon_cons(new_sum, fn() => helper(n + 1, tl, new_sum, pow * x0))
        end
  in
    helper(0, fxs, 0.0, 1.0)
  end

(* ****** ****** *)

(* end of [CS320-2023-Sum1-midterm2-stream_evaluate.sml] *)
