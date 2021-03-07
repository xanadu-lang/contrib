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
  "StreamDemo2-TCT1PairEnum"
(* ****** ****** *)
impltmp
StreamDemo2_stream_name<>() =
  "Enumerating 2-winning TCT1 pairs"
impltmp
StreamDemo2_input_descript<>() =
  "The stream of 2-winning TCT1 pairs: (0, 0), (1, 2), (2, 1), , ..."
(* ****** ****** *)
impltmp
StreamDemo2_stream<>() =
(
let
val
ijs = helper1(0)
in
(
stream_sieve(ijs) where
{
impltmp
sieve$test<item>
(ij1, ij2) =
let
val (i1, j1) = ij1
val (i2, j2) = ij2
in
if
(i1 = i2) then false
else
(
if
(j1 = j2) then false else(i1+j2!=i2+j1)
)
end
}
)
end
) where
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

(* end of [TCT1PairEnum.dats] *)
