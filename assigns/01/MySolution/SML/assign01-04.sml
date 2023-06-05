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

fun str2int_opt(cs: string): int option =
  let
    fun isDigit(c: char): bool =
      Char.ord(c) >= Char.ord(#"0") andalso Char.ord(c) <= Char.ord(#"9")
      
    fun helper(i0: int): int option =
      if i0 <= 0 then NONE
      else if isDigit(String.sub(cs, i0-1)) then
        let
          val digit = Char.ord(String.sub(cs, i0-1)) - Char.ord(#"0")
          val rest = helper(i0 - 1)
        in
          case rest of
            NONE => SOME digit
          | SOME acc => SOME (10 * acc + digit)
        end
      else NONE
  in
    if String.size cs > 0 then
      let
        val isValid = List.all isDigit (String.explode cs)
      in
        if isValid then helper (String.size cs)
        else NONE
      end
    else NONE
  end






val result = str2int_opt("01234")		
val result1 = str2int_opt("1234")		
val result2 = str2int_opt("01s234")	
val result3 = str2int_opt("01=234")	
val result4 = str2int_opt("01+234")	

(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign01-04.sml] *)
