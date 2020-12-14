(* ****** ****** *)
#staload
"./../SATS/StreamDemo.sats"
(* ****** ****** *)
#define none optn_nil
#define some optn_cons
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
(dir = 0)
then
(
case+ zs of
|
list_nil() =>
strxcon_cons
(none(), aux0(ys, zs))
|
list_cons(z0, _) =>
strxcon_cons
( some(z0), aux0(ys, zs) )
) (* end of [then] *)
else
(
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
list_cons(z0, zs) =>
strxcon_cons
( some(z0)
, aux0(list_cons(z0, ys), zs)
)
) (* end of [then] *)
else
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
(dir = 0)
then
(
case+ zs of
|
list_cons
( z0, _ ) =>
strxcon_cons
( some(z0), aux1(xs, ys, zs) )
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
, aux1(xs, ys, list_cons(x0, zs))
)
) (* end of [list_nil] *)
) (* end of [then] *)
else
(
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
)
) (* end of [else] *)
end ) (*let*) // end of [ aux1 ]
(* ****** ****** *)
} (*where*) // end of [StreamDemo_moves]

(* ****** ****** *)

local
//
absimpl
StreamDemo_type(a:t0) =
( a0ref(int)
, a0ref(streax(optn(a)))
)
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
mydir = a0ref_make(0)
//
impltmp
StreamDemo$dir<>
( (*void*)) = get(mydir)
//
in
( mydir
, a0ref_make
  (StreamDemo_moves<a>(xs))
)
end // end of [StreamDemo_make]
//
(* ****** ****** *)
//
impltmp
<a>(*tmp*)
StreamDemo_get_elt
  (demo) = let
//
typedef
data = streax(optn(a))
//
val xs =
a0ref_get<data>(demo.1)
val+
strxcon_cons(x0, xs) = !xs
val () =
a0ref_set<data>(demo.1, xs) in x0
//
end // [StreamDemo_get_elt]
//
(* ****** ****** *)
impltmp
<a>(*tmp*)
StreamDemo_get_dir
  (demo) =
(
  a0ref_get<int>(demo.0)
)
impltmp
<a>(*tmp*)
StreamDemo_set_dir
  (demo, dir) =
(
  a0ref_set<int>(demo.0, dir)
)
(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

impltmp
<a>(*tmp*)
StreamDemo_reset(demo) =
let
val () =
StreamDemo_set_dir(demo, 0-1) in loop(demo)
end where
{
fun
loop(demo): void =
let
val opt = StreamDemo_get_elt(demo)
in
case+ opt of
| optn_nil() => () | optn_cons _ => loop(demo)
end // end of [loop]
} (*where*) // end of [StreamDemo_reset]

(* ****** ****** *)
//
impltmp
<a>(*tmp*)
StreamDemo_next1(demo) =
let
val () =
StreamDemo_set_dir(demo, 0+1) in StreamDemo_get_elt(demo)
end
//
impltmp
<a>(*tmp*)
StreamDemo_prev1(demo) =
let
val () =
StreamDemo_set_dir(demo, 0-1) in StreamDemo_get_elt(demo)
end
//
(* ****** ****** *)

(* end of [StreamDemo.dats] *)
