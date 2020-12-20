(* ****** ****** *)
(*
** HX: HanoiTower
*)
(* ****** ****** *)
#include"\
$(XATS2JSD)\
/share/xats2js_prelude.hats"
(* ****** ****** *)
#staload
"prelude\
/DATS/CATS/JS/Node/g_print.dats"
(* ****** ****** *)
typedef int2 = (int, int)
(* ****** ****** *)

(*
** HX-2020-12-19:
** Testing mutual recursion
*)

fun
move12
( n0: int
, rs: list(int2)): list(int2) =
if
(n0 <= 0)
then rs else 
move32
( n0-1
, list_cons((1, 2), move13(n0-1, rs)))

and
move13
( n0: int
, rs: list(int2)): list(int2) =
if
(n0 <= 0)
then rs else 
move23
( n0-1
, list_cons((1, 3), move12(n0-1, rs)))

and
move21
( n0: int
, rs: list(int2)): list(int2) =
if
(n0 <= 0)
then rs else 
move31
( n0-1
, list_cons((2, 1), move23(n0-1, rs)))
and
move23
( n0: int
, rs: list(int2)): list(int2) =
if
(n0 <= 0)
then rs else 
move13
( n0-1
, list_cons((2, 3), move21(n0-1, rs)))

and
move31
( n0: int
, rs: list(int2)): list(int2) =
if
(n0 <= 0)
then rs else 
move21
( n0-1
, list_cons((3, 1), move32(n0-1, rs)))

and
move32
( n0: int
, rs: list(int2)): list(int2) =
if
(n0 <= 0)
then rs else 
move12
( n0-1
, list_cons((3, 2), move31(n0-1, rs)))

(* ****** ****** *)
//
fun
HanoiTower_play
( N: int ): list(int2) =
  list_reverse( move12(N, list_nil()) )
//
(* ****** ****** *)
(*
val the_moves_4 = HanoiTower_play(4)
val ( (*void*) ) = println("the_moves_4: ", the_moves_4)
*)
(* ****** ****** *)
#define N = 8
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
absimpl item_type =
(list(int), list(int), list(int))
(* ****** ****** *)
impltmp
StreamDemo2_title<>() =
  "StreamDemo2-HanoiTower"
(* ****** ****** *)
impltmp
StreamDemo2_stream_name<>() =
  "Solving the HanoiTower Puzzle of 8"
impltmp
StreamDemo2_input_descript<>() =
  "The stream of moves for solving the HanoiTower Puzzle of 8"
(* ****** ****** *)
impltmp
StreamDemo2_stream<>() =
let
val p1 =
auxlst(0) where
{
fun
auxlst
( i0
: int )
: list(int) =
(
if
(i0 >= N)
then
list_nil(*void*)
else
list_cons(i0+1, auxlst(i0+1))
)
} (*where*) // end-of-val
//
val p2 = list_nil(*void*)
val p3 = list_nil(*void*)
//
val poles =
a1ref_make_list
(
list_cons
( p1
, list_cons
  ( p2
  , list_cons(p3, list_nil()))
)
)
//
val moves = HanoiTower_play(N)
//
in
(
  auxmain(moves)) where
{
fun
auxmain
( mvs
: list(int2)): stream(item) =
$lazy
(
case- mvs of
|
list_nil() => !
(
stream_sing
((poles[0], poles[1], poles[2]))
)
|
list_cons(mv0, mvs) =>
let
val i0 = mv0.0-1
val j0 = mv0.1-1
val pi = poles[i0]
val pj = poles[j0]
val x0 =
  list_head_exn(pi)
val () =
  poles[i0] :=
  list_tail_exn(pi)
val () =
  poles[j0] := list_cons(x0, pj)
in
strmcon_cons
((poles[0], poles[1], poles[2]), auxmain(mvs))
end // end of [let] // list_cons
)
}
end // end of [StreamDemo2_stream<>()]

(* ****** ****** *)

(* end of [HanoiTower.dats] *)
