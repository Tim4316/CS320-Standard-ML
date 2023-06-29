(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-06-19: 20 points
Given a list xs, stream_permute_list(xs) returns
a stream of ALL the permutations of xs.
For instance, if xs = [1,2,3], then the returned
stream should enumerate the following 6 lists:
[1,2,3], [1,3,2], [2,1,3], [2,3,1], [3,1,2] and [3,2,1]
//
fun
stream_permute_list(xs: 'a list): 'a list stream = ...
//
*)

(* ****** ****** *)
fun remove_at xs i = let
  val (front, back) = List.splitAt(xs, i)
in
  front @ List.drop(back, 1)
end

fun insert_everywhere x xs = let
  fun helper pre xs = 
    case xs of
      [] => [pre @ [x]]
    | h::t => (pre @ [x] @ xs) :: (helper (pre @ [h]) t)
in
  helper [] xs
end

fun
stream_permute_list(xs: 'a list): 'a list stream =
let
  fun permute [] = stream_cons([], stream_nil)
    | permute xs =
      stream_concat(
        stream_make_imap(list_streamize(xs), fn (i, x) =>
          stream_make_map(permute(remove_at xs i), fn ys => x::ys)
        )
      )
in
  permute xs
end
(* end of [CS320-2023-Sum1-assign04-01.sml] *)
