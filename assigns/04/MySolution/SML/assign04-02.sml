(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
//
HX-2023-06-20: 20 points
Please implement the following function
that enumerates all the pairs (i, j) of natural
numbers satisfying $i <= j$; a pair (i1, j1) must
be enumerated ahead of another pair (i2, j2) if the
following condition holds:
  i1*i1*i1 + j1*j1*j1 < i2*i2*i2 + j2*j2*j2
//
val
theNatPairs_cubesum: (int * int) stream = fn () => ...
//
*)

(* ****** ****** *)
val theNatPairs_cubesum: (int * int) stream = fn () =>
  let
    fun pairs_stream(i: int) : (int * int) stream = fn() =>
      strcon_cons((i, i), stream_tabulate(~1, fn j => (i, i + j + 1)))

    fun compare_pairs((i1, j1): int * int, (i2, j2): int * int): bool =
      i1*i1*i1 + j1*j1*j1 <= i2*i2*i2 + j2*j2*j2

    fun merge_all(n: int, prev: (int * int) stream) : (int * int) stream = fn () =>
      strcon_cons(
        stream_head(prev), 
        stream_merge2(stream_tail(prev), merge_all(n+1, pairs_stream(n+1)), compare_pairs)
      )
  in
    merge_all(0, pairs_stream(0))()
  end
(* end of [CS320-2023-Sum1-assign04-02.sml] *)
