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
#define N 6
//
(* ****** ****** *)

abstype
node_type == list(int)
typedef node = node_type

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
absimpl
item_type = list(int)
(* ****** ****** *)
impltmp
StreamDemo2_title<>() =
  "StreamDemo2-Permutation"
(* ****** ****** *)
impltmp
StreamDemo2_stream_name<>() =
  "Enumerating permutations"
impltmp
StreamDemo2_input_descript<>() =
  "The stream of permutations of (0, 1, 2, 3, 4, 5)"
(* ****** ****** *)

impltmp
StreamDemo2_stream<>() =
let
//
(*
val xs = auxlst(0) where
{
fun
auxlst(i: int): list(int) =
if
(i < N)
then
list_cons
(i, auxlst(i+1)) else list_nil()
}
*)
//
val xs =
gint_listize_nint(N)
val xs = list_vt2t(xs)
//
in
  stream_vt2t(gseq_permutize(xs))
end // end of [StreamDemo2_stream<>]

(* ****** ****** *)
impltmp
StreamDemo2_xprint<>
  ( opt ) =
(
case+ opt of
| optn_nil() => ()
| optn_cons(xs) => print(xs)
)
(* ****** ****** *)
impltmp
StreamDemo2_pauseq<>
  ( opt ) =
(
case+ opt of
| optn_nil() => false
| optn_cons(xs) =>
  let
    impltmp
    g_lte<int> = gint_gte_sint_sint
  in
    gseq_sortedq<list(int)><int>(xs)
  end
)
(* ****** ****** *)
#include "$(STREAMDEMO2)/StreamDemo2_.dats"
(* ****** ****** *)

(* end of [Permutation.dats] *)
