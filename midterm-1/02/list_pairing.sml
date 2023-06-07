(* ****** ****** *)
use "./../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
(*
HX-2023-03-01: midterm1-02: 10 points
*)
(* ****** ****** *)
(*
Given a list xs, list_pairing(xs) returns
a list of pairs and an option; the 1st pair
consists of the first and last elements in xs,
and the 2nd pair consists of the second and the
second last elements in xs, and so on and so forth;
and the option is NONE if |xs| is even, and it is
SOME(xm) if |xs| is odd and xm is the middle element
in xs.
//
For instance, we have:
//
list_pairing([]) = ([], NONE)
list_pairing([1]) = ([], SOME(1))
list_pairing([1,2]) = ([(1,2)], NONE)
list_pairing([1,2,3]) = ([(1,3)], SOME(2))
list_pairing([1,2,3,4]) = ([(1,4),(2,3)], NONE)
//
Yes, you can define recursive functions in your
implementation.
//
*)
(* ****** ****** *)

fun list_nth(xs: 'a list, n: int): 'a =
(
  case xs of
     nil => raise Subscript
   | x1 :: xs => if n <= 0 then x1 else list_nth(xs, n-1)
)

fun list_pairing(xs: 'a list): ('a * 'a) list * 'a option =
  let
    fun pair(xs: 'a list): ('a * 'a) list =
      case xs of
        [] => []
      | [x] => []
      | x1 :: xn :: rest => (x1, xn) :: pair(rest)

    fun mid(xs: 'a list): 'a option =
      let
        val len = length xs
      in
        if len mod 2 = 0 then NONE
        else SOME (list_nth(xs, len div 2))
      end

    val p0 = pair xs
    val opt = mid xs
  in
    (p0, opt)
  end
(* ****** ****** *)

(* end of [CS320-2023-Sum1-midterm1-list_pairing.sml] *)
