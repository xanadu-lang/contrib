(* ****** ****** *)
#include"\
$(XATS2JSD)\
/share/xats2js_prelude.hats"
(* ****** ****** *)
#define
STREAMDEMO =
"./../../../StreamDemo"
#define
STREAMDEMO2 =
"./../../../StreamDemo2"
(* ****** ****** *)
#staload
"\
$(STREAMDEMO2)/StreamDemo2.dats"
#staload
"$(STREAMDEMO)/SATS/StreamDemo.sats"
#staload
"$(STREAMDEMO)/DATS/StreamDemo.dats"
(* ****** ****** *)
absimpl
item_type =
(nint, nint)
(* ****** ****** *)
impltmp
StreamDemo2_title<>() =
  "StreamDemo2-NatPairEnum"
(* ****** ****** *)
impltmp
StreamDemo2_stream_name<>() =
  "Enumerating Pairs of Naturals"
impltmp
StreamDemo2_input_descript<>() =
  "The stream of pairs of naturals: (0, 0), (0, 1), (1, 0), (0, 2), (1, 1), (2, 0), ..."
(* ****** ****** *)
impltmp
StreamDemo2_stream<>() =
(
helper1(0) ) where
{
fun
helper1(ij: nint): stream(item) =
helper2(ij, 0(*i*))
and
helper2
(ij: nint, i: nint): stream(item) =
$lazy
(
strmcon_cons
( (i, ij-i)
, if
  ( i < ij )
  then
  helper2(ij, i+1) else helper1(ij+1)
)
)
} (* end of [StreamDemo2_stream<>] *)
(* ****** ****** *)
impltmp
StreamDemo2_xprint<>
  ( opt ) =
(
case+ opt of
| optn_nil() => ()
| optn_cons(ij) =>
  print
  ("(", "i=", ij.0, ", ", "j=", ij.1, ")")
)
(* ****** ****** *)
(*
impltmp
StreamDemo2_pauseq<>(opt) = false
*)
(* ****** ****** *)
#include "$(STREAMDEMO2)/StreamDemo2_.dats"
(* ****** ****** *)

(* end of [NatPairEnum.dats] *)
