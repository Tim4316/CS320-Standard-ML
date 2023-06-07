(* ****** ****** *)
use "./../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
(*
HX-2023-06-06: midterm1-05: 20 points
*)
(* ****** ****** *)
(*
Magic Triangle:
             1
           1   1
         1   2   1
       1   3   3   1
     1   4   6   4   1
   1   5   10  10  5   1
 1   6   15  20  15  6   1

THe magic triangle has the following structure:
- All numbers on the left and right borders are 1.
- All numbers in the interior (non-border) are the sum of the numbers in the row directly above it.

The following example shows how row 6 is computed from row 5.

row 5:      1     4     6     4    1
           / \   / \   / \   / \  / \
row 6:    1   1+4   4+6   6+4  4+1   1


We can represent a magic triangle in SML as an int list list where each row
is stored as a nested int list.

row 0  [[1]
row 1   [1,  1]
row 2   [1,  2,  1]
row 3   [1,  3,  3,  1]
row 4   [1,  4,  6,  4,  1]
row 5   [1,  5,  10, 10, 5,  1]
row 6   [1,  6,  15, 20, 15, 6,  1]]
...


Please implement a function that produces a magic triangle with n row.

triangle 0 = [[1]]
triangle 1 = [[1], [1, 1]]
triangle 2 = [[1], [1, 1], [1, 2, 1]]
triangle 3 = [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1]]
triangle 4 = [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1]]
...
triangle n = ??

Hint: You might want a helper function to compute the current row from
the previous.

*)

fun magic_triangle(n: int): int list list =
    let
        fun comp_row(prev_row: int list): int list =
            case prev_row of
                [] => [1]
              | row =>
                  let
                      fun comp_row([], _) = []
                        | comp_row(x::[], _) = [x]
                        | comp_row(x::y::xs, prev) = (x + y) :: comp_row(y::xs, y)
                  in
                      1 :: comp_row(prev_row, 1)
                  end
    in
        if n < 0 then []
        else if n = 0 then [[1]]
        else
            let
                val prev_tri = magic_triangle(n - 1)
            in
                prev_tri @ [comp_row(list_last(prev_tri))]
            end
    end

(* ****** ****** *)


(* ****** ****** *)

(* end of [CS320-2023-Sum1-midterm1-magic_triangle.sml] *)
