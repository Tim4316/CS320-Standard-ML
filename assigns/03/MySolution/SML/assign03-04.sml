(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-03-24: 10 points
The following is a well-known series:
ln 2 = 1 - 1/2 + 1/3 - 1/4 + ...
Please implement a stream consisting of all the partial
sums of this series.
The 1st item in the stream equals 1
The 2nd item in the stream equals 1 - 1/2
The 3rd item in the stream equals 1 - 1/2 + 1/3
The 4th item in the stream equals 1 - 1/2 + 1/3 - 1/4
And so on, and so forth
//
*)

(* ****** ****** *)

(*
val the_ln2_stream: real stream = fn() => ...
*)

(* Stream definition *)

val the_ln2_stream: real stream = fn () =>
let
    fun helper(n, sum, sign) = 
      strcon_cons(sum, fn () => helper(n+1, sum + sign / real(n+1), ~sign))
in
    helper(1, 1.0, ~1.0)
end







(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign03-04.sml] *)
