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

(* end of [HanoiTower.dats] *)
