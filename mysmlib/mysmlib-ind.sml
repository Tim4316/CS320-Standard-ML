(* ****** ****** *)
(*
HX-2023-05-23:
Library functions
for BUCASCS320-2023-Sum1
This is an individual library,
that is, it is NOT shared by the class.
*)
(* ****** ****** *)
fun list_filter(p: 'a -> bool, xs: 'a list): 'a list =
  case xs of
    [] => []
  | x :: xs' =>
      if p(x)
      then x :: filter(p, xs')
      else filter(p, xs')
(* end of [BUCASCS320-2023-Sum1-mysmlib-ind.sml] *)
