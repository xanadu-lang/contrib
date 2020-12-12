(*
(* ****** ****** *)
#include"\
$(XATS2JSD)\
/share/xats2js_prelude.hats"
(* ****** ****** *)
#define
STREAMDEMO = "./../StreamDemo"
#define
STREAMDEMO2 = "./../StreamDemo2"
(* ****** ****** *)
#staload
"\
$(STREAMDEMO2)/StreamDemo2.sats"
(* ****** ****** *)
#staload
"$(STREAMDEMO)/SATS/StreamDemo.sats"
#staload
"$(STREAMDEMO)/DATS/StreamDemo.dats"
(* ****** ****** *)
*)
//
#extern
fun
the_StreamDemo2_reset
  ((*void*)): void = $exname()
#extern
fun
the_StreamDemo2_next1
  ((*void*)): optn(item) = $exname()
#extern
fun
the_StreamDemo2_prev1
  ((*void*)): optn(item) = $exname()
//
(* ****** ****** *)
//
#extern
fun
the_StreamDemo2_pauseq
  (opt: optn(item)): bool = $exname()
//
#extern
fun
the_StreamDemo2_xprint
  (opt: optn(item)): void = $exname()
//
(* ****** ****** *)
local
  val
  the_demo =
  StreamDemo_make
  (StreamDemo2_data<>((*void*)))
in(*in-of-local*)
(* ****** ****** *)
//
implfun
the_StreamDemo2_reset
((*void*)) = StreamDemo_reset(the_demo)
//
implfun
the_StreamDemo2_next1
((*void*)) = StreamDemo_next1(the_demo)
//
implfun
the_StreamDemo2_prev1
((*void*)) = StreamDemo_prev1(the_demo)
//
(* ****** ****** *)
end // end of [local]
(* ****** ****** *)
impltmp
the_StreamDemo2_pauseq(opt) = StreamDemo2_pauseq<>(opt)
impltmp
the_StreamDemo2_xprint(opt) = StreamDemo2_xprint<>(opt)
(* ****** ****** *)
(* end of [StreamDemo2.dats] *)