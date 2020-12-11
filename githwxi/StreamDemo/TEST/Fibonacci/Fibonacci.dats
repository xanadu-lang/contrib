(* ****** ****** *)
#include"\
$(XATS2JSD)\
/share/xats2js_prelude.hats"
(* ****** ****** *)
#define
STREAMDEMO "./../../DATS"
#staload
"$(STREAMDEMO)/StreamDemo.dats"
(* ****** ****** *)
val
theFibonacciDemo =
StreamDemo_make<int>(fibo(0, 1)) where
{
fun
fibo(f0, f1) =
$lazy(strmcon_cons(f0, fibo(f1, f0+f1)))
} (*where*) // end of [theFibonacciDemo]
(* ****** ****** *)
//
#extern
fun
Fibonacci_control_next(): void = $exname()
#extern
fun
Fibonacci_control_prev(): void = $exname()
//
#extern
fun
JS_Fibonacci_show_none(): void = $exname()
#extern
fun
JS_Fibonacci_show_some(x0: int): void = $exname()
//
(* ****** ****** *)
//
implfun
Fibonacci_control_next
  ((*void*)) =
let
val x0 =
StreamDemo_next1<int>(theFibonacciDemo)
in
case- x0 of
| optn_cons(f0) => JS_Fibonacci_show_some(f0)
end (*let*) // end of [Fibonacci_control_next]
//
implfun
Fibonacci_control_prev
  ((*void*)) =
let
val x0 =
StreamDemo_prev1<int>(theFibonacciDemo)
in
case+ x0 of
| optn_nil() => JS_Fibonacci_show_none()
| optn_cons(f0) => JS_Fibonacci_show_some(f0)
end (*let*) // end of [Fibonacci_control_prev]
//
(* ****** ****** *)

(* end of [Fibonacci.dats] *)

