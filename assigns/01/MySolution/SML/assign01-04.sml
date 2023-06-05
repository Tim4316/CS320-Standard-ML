(* ****** ****** *)

use "./../../assign01-lib.sml";

(* ****** ****** *)

(*
//
Assign01-04: 10 points
//
Please recall the following question in Assign00:
Assign00-04: 10 points
Please implement a function that converts a given
string to an integer:
fun str2int(cs: string): int
In particular, it is expected that str2int(int2str(x)) = x
//
This time you are asked to implement the following
function that only turns a legal representation of an integer
into an integer. By a legal representation of an integer, we
mean a string consisting of a non-empty sequence of digits (where
the digit '0' can be a leading digit).
//
fun str2int_opt(cs: string): int option
//
*)

(* ****** ****** *)
fun
str2int_opt(cs: string): int option = raise NotImplemented320

fun isDigit(c: char): bool =
  let
    val zero = Char.ord(#"0")
    val nine = Char.ord(#"9")
    val charCode = Char.ord(c)
  in
    charCode >= zero andalso charCode <= nine
  end

fun str2int_opt(cs: string): int option =
  let
    fun helper(i: int, acc: int): int option =
      if i >= String.size cs then
        SOME acc
      else if isDigit(String.sub(cs, i)) then
        let
          val digit = Char.ord(String.sub(cs, i)) - Char.ord(#"0")
          val newAcc = acc * 10 + digit
        in
          helper(i + 1, newAcc)
        end
      else
        NONE
  in
    if String.size cs = 0 then
      NONE
    else
      helper(0, 0)
  end

(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign01-04.sml] *)
