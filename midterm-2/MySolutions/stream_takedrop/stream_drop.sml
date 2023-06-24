(* ****** ****** *)

use
"./../../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

(*
fun
stream_drop(fxs, n) = ...
*)

fun stream_drop(fxs: 'a stream, n: int): 'a stream =
  if n <= 0 then fxs
  else
    fn () =>
      case fxs() of
        strcon_nil => strcon_nil
      | strcon_cons(_, fxs') => stream_drop((fn () => fxs'()), n - 1) ()

(* ****** ****** *)

(* end of [CS320-2023-Sum1-stream_drop.sml] *)
