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
absimpl item_type = nint
(* ****** ****** *)
impltmp
StreamDemo2_title<>() =
  "StreamDemo2-Fibonacci"
(* ****** ****** *)
impltmp
StreamDemo2_stream_name<>() =
"Enumerating Fibonacci Numbers"
impltmp
StreamDemo2_input_descript<>() =
"The stream of Fibonacci numbers: 0, 1, 1, 2, 3, 5, 8, 13, ..."
(* ****** ****** *)
impltmp
StreamDemo2_stream<>
  ((*void*)) = fibo(0, 1) where
{
fun
fibo
(f0: int, f1: int) =
$lazy(strmcon_cons(f0, fibo(f1, f0+f1)))
} (* end of [StreamDemo2_stream<>] *)
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
#include "$(STREAMDEMO2)/StreamDemo2_.dats"
(* ****** ****** *)

(* end of [Fibonacci.dats] *)
