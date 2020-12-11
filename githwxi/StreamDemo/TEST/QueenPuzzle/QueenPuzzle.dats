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
#define
STREAMDEMO "./../../DATS"
#staload
"$(STREAMDEMO)/StreamDemo.dats"
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
(xs: list(int)): void =
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
auxrows(xs);
auxrest(N-size(xs));
println("\n\n");
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

val
theQueenPuzzleDemo =
StreamDemo_make
(
stream_vt2t
(gtree_dfs_streamize(the_root))
) where
{
impltmp
gtree_node_childlst<node> = qextend
} (* end of [theQueenPuzzleDemo] *)

(* ****** ****** *)
//
#extern
fun
theQueenPuzzleDemo_reset
  ((*void*)): void = $exname()
#extern
fun
theQueenPuzzleDemo_next1
  ((*void*)): optn(node) = $exname()
#extern
fun
theQueenPuzzleDemo_prev1
  ((*void*)): optn(node) = $exname()
//
implfun
theQueenPuzzleDemo_reset
  ((*void*)) =
StreamDemo_reset<node>(theQueenPuzzleDemo)
//
implfun
theQueenPuzzleDemo_next1
  ((*void*)) =
StreamDemo_next1<node>(theQueenPuzzleDemo)
//
implfun
theQueenPuzzleDemo_prev1
  ((*void*)) =
StreamDemo_prev1<node>(theQueenPuzzleDemo)
//
(* ****** ****** *)
#extern
fun
theQueenPuzzleDemo_solq
  (opt: optn(node)): bool = $exname()
#extern
fun
theQueenPuzzleDemo_print
  (opt: optn(node)): void = $exname()
//
impltmp
theQueenPuzzleDemo_solq
  ( nodeopt ) =
(
case+ nodeopt of
| optn_cons(xs) => (size(xs) = N) | _ => false
)
impltmp
theQueenPuzzleDemo_print
  ( nodeopt ) =
(
case+ nodeopt of
| optn_nil() => () | optn_cons(xs) => qprint(xs)
)
(* ****** ****** *)

(* end of [QueenPuzzle.dats] *)
