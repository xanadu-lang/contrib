(* ****** ****** *)
(*
** HX: HanoiTower
*)
(* ****** ****** *)
#include"\
$(XATS2JSD)\
/share/xats2js_prelude.hats"
(* ****** ****** *)
#define N 8
(* ****** ****** *)

typedef int2 = (int, int)
(* ****** ****** *)

fun
move12
( n0: int
, rs: list(int2)): list(int2) =
if
(n <= 0)
then rs else 
move32
( n-1
, list_cons((1, 2), move13(n-1, rs)))
and
move13
( n0: int
, rs: list(int2)): list(int2) =
if
(n <= 0)
then rs else 
move23
( n-1
, list_cons((1, 3), move12(n-1, rs)))
and
move21
( n0: int
, rs: list(int2)): list(int2) =
if
(n <= 0)
then rs else 
move31
( n-1
, list_cons((2, 1), move23(n-1, rs)))
and
move23
( n0: int
, rs: list(int2)): list(int2) =
if
(n <= 0)
then rs else 
move13
( n-1
, list_cons((2, 3), move21(n-1, rs)))
and
move31
( n0: int
, rs: list(int2)): list(int2) =
if
(n <= 0)
then rs else 
move21
( n-1
, list_cons((3, 1), move32(n-1, rs)))
and
move32
( n0: int
, rs: list(int2)): list(int2) =
if
(n <= 0)
then rs else 
move12
( n-1
, list_cons((3, 2), move31(n-1, rs)))

(* ****** ****** *)

(* end of [HanoiTower.dats] *)
