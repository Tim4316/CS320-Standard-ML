(* ****** ****** *)
use "./../../assign01-lib.sml";
(* ****** ****** *)
use "./../../MySolution/SML/assign01-01.sml";
(* ****** ****** *)

(*
//
Assign01-02: 10 points
//
Please implement a function
that does subscripting on xlist DIRECTLY:
//
fun xlist_sub(xs: 'a xlist, i0: int): 'a
//
If 'i0' is an illegal index, then xlist_sub
should raise the XlistSubscript exception.
//
You should NOT convert xlist into list and
then do subscripting.
//
*)

(* ****** ****** *)
fun
xlist_sub
(xs: 'a xlist, i0: int): 'a = raise NotImplemented320

exception XlistSubscript

fun xlist_sub(xs: 'a xlist, i0: int): 'a =
    let
        fun Helper(xs, i0) =
            case xs of
                xlist_nil => raise XlistSubscript
              | xlist_cons(x, xs) =>
                if i0 = 0 then x
                else Helper(xs, i0 - 1)
              | xlist_snoc(xs, x) =>
                let
                    val len = xlist_size(xs)
                in
                    if i0 = len then x
                    else if i0 < len then Helper(xs, i0)
                    else raise XlistSubscript
                end
              | xlist_append(xs1, xs2) =>
                let
                    val len1 = xlist_size(xs1)
                    val len2 = xlist_size(xs2)
                in
                    if i0 < len1 then Helper(xs1, i0)
                    else if i0 < len1 + len2 then Helper(xs2, i0 - len1)
                    else raise XlistSubscript
                end
              | xlist_reverse(xs) =>
                let
                    val size = xlist_size(xs)
                in
                    if i0 < 0 orelse i0 >= size then raise XlistSubscript
                    else Helper(xs, size - i0 - 1)
                end

    in
        Helper(xs, i0)
    end
(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign01-02.sml] *)
