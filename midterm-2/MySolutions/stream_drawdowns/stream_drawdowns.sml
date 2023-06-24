(* ****** ****** *)

use
"./../../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

(*
//
// HX-2023-04-20: 20 points
//
// A non-empty sequence of numbers forms a
// "drawdown" if every number in the sequence does not
// exceed the first one. A maximal drawdown is one that
// is not contained in any longer drawdowns.
// Please implement a function stream_drawdowns that takes
// a stream fxs of integers and returns a stream consisting
// of all the maximal drawdowns in fxs.
//
*)

(* ****** ****** *)

(*
fun
stream_drawdowns
(fxs: int stream): int list stream = ...
*)
fun stream_drawdowns (fxs: int stream): int list stream =
  let
    fun helper (fxs: int stream, hd: int, i0: int list): int list strcon =
      case strcon_head(fxs()) of
        cur =>
          if cur <= hd then
            helper(stream_tail(fxs), hd, cur::i0)
          else
            strcon_cons(i0, fn () => helper(stream_tail(fxs), cur, [cur]))
      | _ => strcon_cons(i0, fn () => strcon_nil)
  in
    fn () => helper(fxs, strcon_head(fxs()), [])
  end
(* ****** ****** *)

(* end of [CS320-2023-Sum1-midterm2-stream_drawdowns.sml] *)
