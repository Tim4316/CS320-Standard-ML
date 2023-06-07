(* ****** ****** *)
use "./../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-06-06: 10 points
Please use int1_foldleft to implement
the following functions list_factorials
which, when applied to an integer n, returns
a list consisting the first n factorial numbers.
For instance, we have
list_factorials(0) = []
list_factorials(5) = [1, 1, 2, 6, 24]
list_factorials(6) = [1, 1, 2, 6, 24, 120]
PLEASE NOTE THAT YOU CANNOT DEFINE RECURSIVE
FUNCTIONS IN YOUR IMPLEMENTATION. If you do,
your implementation is disqualified.
*)

fun list_factorials(n: int): int list =
  let
    fun factorial(i: int): int =
      int1_foldleft(int1_foreach(i + 1, fn x => x), 1, fn (acc, x) => acc * x)

    fun range(start: int, end': int): int list =
      int1_foldleft(int1_foreach(end' - start + 1, fn x => x + start), [], fn (acc, x) => acc @ [x])

    val factorials =
      int1_foldleft(range(1, n), [], fn (acc, x) => acc @ [factorial(x)])

  in
    factorials
  end


val reuslt = list_factorials(0)
val result1 = list_factorials(5)
val result2 = list_factorials(6)


(* ****** ****** *)

(* end of [CS320-2023-Sum1-midterm1-list_factorials.sml] *)
(*fun
int1_foreach
(n0: int, work: int -> unit) =
let
fun
loop(i0: int): unit =
if i0 >= n0
then ()
else (work(i0); loop(i0+1)) in loop(0(*i0*))
end 

fun
foreach_to_foldleft
( foreach
: ('xs * ('x0 -> unit)) -> unit
)
: ('xs * 'r0 * ('r0*'x0 -> 'r0)) -> 'r0 =
fn(xs, r0, fopr) =>
let
val res = ref(r0)
in
foreach
( xs
, fn(x0) => res := fopr(!res, x0)); !res
end*)