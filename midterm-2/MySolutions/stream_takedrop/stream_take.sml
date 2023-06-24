(* ****** ****** *)

use
"./../../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

(*
fun
stream_take(fxs, n) = ...
*)

fun stream_take(fxs: 'a stream, n: int): 'a stream =
  if n <= 0 then
    fn () => strcon_nil (* added here for Incompatible types*)
 
  else
    fn () => (* added here for Incompatible types*)
        case fxs() of
            strcon_nil => strcon_nil
          | strcon_cons(x, xs) => strcon_cons(x, stream_take(fn () => xs(), n - 1)) (* added here for Incompatible types*)
(* ****** ****** *)

(* end of [CS320-2023-Sum1-stream_take.sml] *)
