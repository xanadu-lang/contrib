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
  "StreamDemo2-RMJPairEnum"
(* ****** ****** *)
impltmp
StreamDemo2_stream_name<>() =
  "Enumerating Ordered Pairs of Postives"
impltmp
StreamDemo2_input_descript<>() =
  "The stream of pairs of positives ordered by their cubic sums: (1, 1), (2, 2), (1, 3), (2, 3), (3, 3), (1, 4), (2, 4), ..."
(* ****** ****** *)
impltmp
StreamDemo2_stream<>() =
(
  helper1(1)) where
{
//
fun
helper1
(i: int): stream(item) =
$lazy
(
strmcon_cons
( (i, i)
, stream_merge
  (helper1(i+1), helper2(i, i+1)))
) where
{
impltmp
g_sel2<item>
(ij1, ij2) =
let
val
(i1, j1) = ij1
val
(i2, j2) = ij2
val sum1 =
i1*i1*i1+j1*j1*j1
val sum2 =
i2*i2*i2+j2*j2*j2
val res0 = cmp(sum1, sum2)
in
if res0 != 0 then res0 else cmp(i1, i2)
end
} (*where*) // end of [helper1]
//
and
helper2
(i: int, j: int) =
$lazy
(
strmcon_cons((i, j), helper2(i, j+1))
)
//
} (* end of [StreamDemo2_stream<>] *)
(* ****** ****** *)
impltmp
StreamDemo2_xprint<>
  ( opt ) =
(
case+ opt of
| optn_nil() => ()
| optn_cons(ij) =>
  let
  val (i, j) = ij
  in
  print
  ("(i=", i, ", j=", j, ", i^3+j^3=", i*i*i+j*j*j, ")")
  end
)
(* ****** ****** *)
(*
impltmp
StreamDemo2_pauseq<>(opt) = false
*)
(* ****** ****** *)
#include "$(STREAMDEMO2)/StreamDemo2_.dats"
(* ****** ****** *)

(* end of [RMJPairEnum.dats] *)
