(* ****** ****** *)
abstype item_type
typedef item = item_type
(* ****** ****** *)
fun<>
StreamDemo2_data(): stream(item)
(* ****** ****** *)
fun<>
StreamDemo2_pauseq(opt: optn(item)): bool
fun<>
StreamDemo2_xprint(opt: optn(item)): void
(* ****** ****** *)

(* end of [StreamDemo2.sats] *)