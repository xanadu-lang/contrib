(* ****** ****** *)
(*
** HX: HanoiTower
*)
(* ****** ****** *)
#include"\
$(XATS2JSD)\
/share/xats2js_prelude.hats"
(* ****** ****** *)
(*
#staload
"prelude\
/DATS/CATS/JS/Node/g_print.dats"
*)
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
//
#extern
fun
print_item
(xyz: item): void
//
(* ****** ****** *)
absimpl
item_type =
( list(int)
, list(int)
, list(int) )
(* ****** ****** *)
//
(*
implfun
print_item
  (xyz) =
( println(xyz.0);
  println(xyz.1);
  println(xyz.2); )
*)
//
(* ****** ****** *)
//
fun
disk_get_at
( ds
: list(int)
, i0 : int ): int =
let
val
n0 = length(ds)
in
if
(n0+i0 < N)
then 0 else ds[n0+i0-N]
end
//
fun
print_disk
(i0: int): void =
let
fun
auxl
(j0: int): void =
if
(j0 < N)
then
(
if
(i0+j0) < N
then print(' ')
else print('@'); auxl(j0+1)
)
fun
auxr
(j0: int): void =
if
(j0 < N)
then
(
if
(j0 < i0)
then print('@')
else print(' '); auxr(j0+1)
)
in
  (auxl(0); print("|"); auxr(0))
end // end of [print_disk]
//
implfun
print_item
  (xyz) =
( loop(0) ) where
{
fun
loop(i0: int): void =
if
(i0 < N)
then
(
print_disk
(disk_get_at(xyz.0, i0));
print_disk
(disk_get_at(xyz.1, i0));
print_disk
(disk_get_at(xyz.2, i0));
println((*void*)); loop(i0+1)
)
} (* end of [print_item] *)
//
(* ****** ****** *)
impltmp
StreamDemo2_title<>() =
  "StreamDemo2-HanoiTower"
(* ****** ****** *)
impltmp
StreamDemo2_stream_name<>() =
  "Solving the HanoiTower Puzzle"
impltmp
StreamDemo2_input_descript<>() =
  "The stream of moves for solving the HanoiTower Puzzle of 8 discs"
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
let
val p1 = poles[0]
val p2 = poles[1]
val p3 = poles[2]
in
case+ mvs of
|
list_nil
((*void*)) => !
(
stream_sing((p1, p2, p3))
)
|
list_cons
(mv0, mvs) =>
let
//
val i0 = mv0.0-1
val j0 = mv0.1-1
val pi = poles[i0]
val pj = poles[j0]
//
val-
list_cons
( x0, xs ) = pi
//
val () =
( poles[i0] := xs )
val () =
( poles[j0] := list_cons(x0, pj) )
//
in
strmcon_cons((p1, p2, p3), auxmain(mvs))
end // list_cons
//
end // end of [let]
)
}
end // end of [StreamDemo2_stream<>()]

(* ****** ****** *)

impltmp
StreamDemo2_xprint<>
  ( opt ) =
(
case+ opt of
| optn_nil() => ()
| optn_cons(xs) => print_item(xs)
)
impltmp
StreamDemo2_pauseq<>
  ( opt ) =
(
case+ opt of
| optn_cons(xyz) =>
  (length(xyz.1) = N) | optn_nil() => false
)

(* ****** ****** *)
#include "$(STREAMDEMO2)/StreamDemo2_.dats"
(* ****** ****** *)

(* end of [HanoiTower.dats] *)
