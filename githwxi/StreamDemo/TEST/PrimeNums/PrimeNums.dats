(* ****** ****** *)
#include"\
$(XATS2JSD)\
/share/xats2js_prelude.hats"
(* ****** ****** *)
#define STREAMDEMO = "./../.."
(* ****** ****** *)
#staload
"$(STREAMDEMO)/SATS/StreamDemo.sats"
#staload
"$(STREAMDEMO)/DATS/StreamDemo.dats"
(* ****** ****** *)
val
thePrimeNumsDemo =
StreamDemo_make
(helper(fromto(2))) where
{
fun
fromto
(n: int): stream(int) =
$lazy
(
strmcon_cons(n, fromto(n+1))
)
fun
helper
(xs: stream(int)): stream(int) =
$lazy
(
let
val-
strmcon_cons(x0, xs) = !xs
in
strmcon_cons
(x0, helper(stream_filter(xs))) where
{
impltmp filter$test<int>(x1) = (x1 % x0 > 0)
}
end
) (* end of [helper] *)
} (*where*) // end of [thePrimeNumsDemo]
(* ****** ****** *)
//
#extern
fun
PrimeNums_control_next(): void = $exname()
#extern
fun
PrimeNums_control_prev(): void = $exname()
//
#extern
fun
JS_PrimeNums_show_none(): void = $exname()
#extern
fun
JS_PrimeNums_show_some(x0: int): void = $exname()
//
(* ****** ****** *)
//
implfun
PrimeNums_control_next
  ((*void*)) =
let
val x0 =
StreamDemo_next1<int>(thePrimeNumsDemo)
in
case- x0 of
| optn_cons(f0) => JS_PrimeNums_show_some(f0)
end (*let*) // end of [PrimeNums_control_next]
//
implfun
PrimeNums_control_prev
  ((*void*)) =
let
val x0 =
StreamDemo_prev1<int>(thePrimeNumsDemo)
in
case+ x0 of
| optn_nil() => JS_PrimeNums_show_none()
| optn_cons(f0) => JS_PrimeNums_show_some(f0)
end (*let*) // end of [PrimeNums_control_prev]
//
(* ****** ****** *)

(* end of [PrimeNums.dats] *)

