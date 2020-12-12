(* ****** ****** *)
abstype
StreamDemo_type(a:t0)
sexpdef
StreamDemo = StreamDemo_type
(* ****** ****** *)
//
fun
<a:t0>
StreamDemo_make
(xs: stream(a)): StreamDemo(a)
//
(* ****** ****** *)
fun
<a:t0>
StreamDemo_get_elt
(demo: StreamDemo(a)) : optn(a)
(* ****** ****** *)
fun
<a:t0>
StreamDemo_get_dir
(demo: StreamDemo(a)) : sint
fun
<a:t0>
StreamDemo_set_dir
( demo
: StreamDemo(a), dir:sint): void
(* ****** ****** *)
fun
<a:t0>
StreamDemo_reset
( demo: StreamDemo(a) ) : void
fun
<a:t0>
StreamDemo_next1
( demo: StreamDemo(a) ) : optn(a)
fun
<a:t0>
StreamDemo_prev1
( demo: StreamDemo(a) ) : optn(a)
//
(* ****** ****** *)
//
fun<>
StreamDemo$dir(): int
//
fun
<a:t0>
StreamDemo_moves
(xs: stream(a)): streax(optn(a))
//
(* ****** ****** *)

(* end of [StreamDemo.sats] *)
