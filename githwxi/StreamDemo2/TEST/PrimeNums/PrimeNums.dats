(* ****** ****** *)
(*
** N-queen puzzle
** HX: test-2020-06-08
*)
(* ****** ****** *)
#include"\
$(XATS2JSD)\
/share/xats2js_prelude.hats"
(* ****** ****** *)
#staload"\
$(XATS2JSD)/xatsopt\
/xatslib/githwxi/DATS/gtree1.dats"
(* ****** ****** *)
//
#define N 8
//
(* ****** ****** *)

fun
qtest
( xs
: list(int)
, x0: sint): bool =
(
iforall(xs) where
{
impltmp
iforall$test<sint>(i0, x1) =
if
(x1 != x0)
then abs(x1-x0) != (i0+1) else false
}
) (* qtest *)

(* ****** ****** *)

abstype
node_type == list(int)
typedef node = node_type

(* ****** ****** *)

local
absopen node_type
in(*in-of-local*)

val
the_root: node = list_nil()

fun
size
(xs: node): nint = list_length(xs)

fun
qprint
(xs: node): void =
let
//
fun
auxrow
(i0: int) =
(
  loop(0)) where
{
//
fun
loop(i1: int): void =
if
(i1 < N)
then
loop(i1+1) where
{
val () =
print
(if i0=i1 then "Q " else ". ")
} else println((*void*))
//
} (*where*) // end of [auxrow]
//
fun
auxrows
(xs: node): void =
(
case+ xs of
|
list_nil() => ()
|
list_cons(x0, xs) =>
(auxrows(xs); auxrow(x0))
)
and
auxrest
(n0: sint): void =
if n0 > 0 then
(auxrow(N); auxrest(n0-1))
//
in
auxrows(xs);auxrest(N-size(xs));println("\n\n");
end (* let *) // end of [qprint]

(* ****** ****** *)

fun
qextend
( xs
: node
) : list_vt(node) =
let
fun
auxlst
(x0: int) =
if
(x0 < N)
then
(
if
qtest(xs, x0)
then
list_vt_cons
(list_cons(x0, xs), auxlst(x0+1)) else auxlst(x0+1)
) else list_vt_nil((*void*))
//
in auxlst(0) end

end // end of [local]

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
