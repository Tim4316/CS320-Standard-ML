(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-06-12: 10 points
Please enumerate all the pairs of natural
numbers. Given pairs (i1, j1) and (i2, j2),
(i1, j1) should be enumerated ahead of (i2, j2)
if i1+j1 < i2+j2.
*)

(* ****** ****** *)

(*
val theNatPairs: (int*int) stream = fn () => ...
*)

(* ****** ****** *)

val theNatPairs: (int*int) stream = 
  let 
    fun fxs n = fn () =>
      let
        fun fxs2 i =
          if i > n then
            strcon_nil
          else
            strcon_cons((i, n-i), fn () => fxs2 (i+1))
      in
        fxs2 0
      end
  in
    stream_concat (stream_tabulate (~1, fxs))
  end








(* end of [CS320-2023-Sum1-assign03-05.sml] *)


 