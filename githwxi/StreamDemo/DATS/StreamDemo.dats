(* ****** ****** *)
#staload
REQ = "./required.dats"
(* ****** ****** *)
#include"\
$(XATS2JSD)\
/share/xats2js_prelude.hats"
(* ****** ****** *)
abstbox
StreamDemo_tbox(a:t0)
sexpdef
StreamDemo = StreamDemo_tbox
(* ****** ****** *)
//
#extern
fun
<a:t0>
StreamDemo_make
(xs: stream(a)): StreamDemo(a)
//
#extern
fun
<a:t0>
StreamDemo_next(obj: StreamDemo): optn(a)
#extern
fun
<a:t0>
StreamDemo_prev(obj: StreamDemo): optn(a)
//
(* ****** ****** *)
#define none optn_nil
#define some optn_cons
(* ****** ****** *)
//
#extern
fun<>
StreamDemo$dir(): int
//
#extern
fun
<a:t0>
StreamDemo_moves
(xs: stream(a)): streax(optn(a))
//
(* ****** ****** *)

impltmp
<a>(*tmp*)
StreamDemo_moves
  (xs) =
(
let
val
ys = list_nil()
and
zs = list_nil()
in
  aux1(xs, ys, zs)
end
) where
{
(* ****** ****** *)
fun
aux0
( ys: list(a)
, zs: list(a))
: streax(optn(a)) =
$lazy
(
let
val dir =
StreamDemo$dir<>()
in
if
(dir > 0)
then
(
case+ zs of
|
list_nil() =>
strxcon_cons
(none(), aux0(ys, zs))
|
list_cons(z0, xs) =>
strxcon_cons
( some(z0)
, aux0(list_cons(z0, ys), zs)
)
) (* end of [then] *)
else
(
case+ ys of
|
list_nil() =>
strxcon_cons
(none(), aux0(ys, zs))
|
list_cons(y0, ys) =>
strxcon_cons
( some(y0)
, aux0(ys, list_cons(y0, zs))
)
) (* end of [else] *)
end ) (*let*) // end of [aux0]
(* ****** ****** *)
fun
aux1
( xs
: stream(a)
, ys: list(a)
, zs: list(a))
: streax(optn(a)) =
$lazy
(
let
val dir =
StreamDemo$dir<>()
in
if
(dir > 0)
then
(
case+ zs of
|
list_nil() =>
(
case+ !xs of
|
strmcon_nil() =>
strxcon_cons
(none(), aux0(ys, zs))
|
strmcon_cons(x0, xs) =>
strxcon_cons
( some(x0)
, aux1(xs, list_cons(x0, ys), zs)
)
) (* end of [list_nil] *)
|
list_cons(z0, zs) =>
strxcon_cons
( some(z0)
, aux1(xs, list_cons(z0, ys), zs)
)
) (* end of [then] *)
else
(
case+ ys of
|
list_nil() =>
strxcon_cons
(none(), aux1(xs, ys, zs))
|
list_cons(y0, ys) =>
strxcon_cons
( some(y0)
, aux1(xs, ys, list_cons(y0, zs))
)
) (* end of [else] *)
end ) (*let*) // end of [aux1]
(* ****** ****** *)
} (*where*) // end of [StreamDemo_moves]

(* ****** ****** *)

local
//
absimpl
StreamDemo(a:t0) =
a0ref(streax(optn(a)))
//
in(*in-of-local*)
//
(* ****** ****** *)
//
impltmp
<a>(*tmp*)
StreamDemo_make(xs) =
let
//
val
the_dir = a0ref_make(0)
//
fun
dir_set_next() = set(the_dir,  1)
fun
dir_set_prev() = set(the_dir, -1)
//
impltmp
StreamDemo$dir<>() = get(the_dir)
//
in
a0ref_make(StreamDemo_moves<a>(xs))
end // end of [StreamDemo_make]
//
(* ****** ****** *)
//
implfun
StreamDemo_next
  (demo) = let
//
val () =
dir_set_next()
//
val xs = get(demo)
val+
strxcon_cons(x0, xs) = !xs
val () = set(demo, xs) in x0
//
end (*let*) // end of [StreamDemo_next]
//
implfun
StreamDemo_prev
  (demo) = let
//
val () =
dir_set_prev()
//
val xs = get(demo)
val+
strxcon_cons(x0, xs) = !xs
val () = set(demo, xs) in x0
//
end (*let*) // end of [StreamDemo_prev]
//
(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

(* end of [StreamDemo.dats] *)
