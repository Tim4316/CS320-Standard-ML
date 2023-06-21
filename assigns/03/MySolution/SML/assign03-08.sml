(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-06-12: 10 points
Please implement the following function
that turns a list of streams into stream of
lists.
//
fun
stream_ziplst('a stream list): 'a list stream
//
If we use a list of streams to represent a
list of rows of a matrix, then the returned
stream consist of lists that are columns of the
matrix.
*)

(* ****** ****** *)
fun stream_ziplst (fxs: 'a stream list) : 'a list stream = fn () =>
    case fxs of
      [] => strcon_nil
      | _ => 
      if list_exists (fxs, fn fxs2 => 
          case fxs2() of
            strcon_nil => true
            | _ => false )  
      then strcon_nil
      else 
          let 
              val hds = list_map (fxs, stream_head)
              val tls = list_map (fxs, stream_tail)
          in 
              strcon_cons (hds, stream_ziplst tls)
          end
(* end of [CS320-2023-Sum1-assign03-08.sml] *)
