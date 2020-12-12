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
$(STREAMDEMO2)/StreamDemo2.sats"
#staload
"$(STREAMDEMO)/SATS/StreamDemo.sats"
#staload
"$(STREAMDEMO)/DATS/StreamDemo.dats"
(* ****** ****** *)
absimpl item_type = nint
(* ****** ****** *)
impltmp
StreamDemo2_data<>() =
(helper(fromto(2))) where
{
fun
fromto
(n: nint): stream(nint) =
$lazy
(
strmcon_cons(n, fromto(n+1))
)
fun
helper
(xs: stream(nint)): stream(nint) =
$lazy
(
let
val-
strmcon_cons(x0, xs) = !xs
in
strmcon_cons
(x0, helper(stream_filter(xs))) where
{
impltmp filter$test<nint>(x1) = (x1 % x0 > 0)
}
end
) (* end of [helper] *)
} (* end of [StreamDemo2_data<>] *)
(* ****** ****** *)
impltmp
StreamDemo2_xprint<>
  ( opt ) =
(
case+ opt of
| optn_nil() => ()
| optn_cons(p0) => print(p0)
)
(* ****** ****** *)
impltmp
StreamDemo2_pauseq<>(opt) = false
(* ****** ****** *)
#include "$(STREAMDEMO2)/StreamDemo2.dats"
(* ****** ****** *)

(* end of [PrimeNums.dats] *)
