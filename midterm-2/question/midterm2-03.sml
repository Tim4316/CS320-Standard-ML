(* ****** ****** *)

use "./../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)
(*
HX-2023-04-20:
Given a finite or infinite stream fxss of
infinite streams: fxs_0, fxs_1, fxs_2, ...,
stream_zipstrm(fxss) returns an infinite stream
of streams: gxs_0, gxs_1, gxs_2, ..., where we have
gxs_j[i] = fxs_i[j]. Note that this is just the
stream version of stream_ziplst (see Assign07-01).
*)
(* ****** ****** *)

fun stream_zipstrm (fxss: 'a stream stream) : 'a stream stream = fn () =>
    case fxss() of
      strcon_nil => strcon_nil
      | _ => 
      if stream_forall (fxss, fn fx => 
          case fx() of
            strcon_nil => true
            | _ => false )  
      then strcon_nil
      else 
          let 
              val hds = stream_make_map (fxss, stream_head)
              val tls = stream_make_map (fxss, stream_tail)
          in 
              strcon_cons (hds, stream_zipstrm tls)
          end

(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm2-03.sml] *)
