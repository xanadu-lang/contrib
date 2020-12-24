(* ****** ****** *)
abstype item_type
typedef item = item_type
(* ****** ****** *)
#extern
fun<>
StreamDemo2_title
  ((*void*)): string
impltmp
<>(*tmp*)
StreamDemo2_title
( ) = "StreamDemo2_title()"
(* ****** ****** *)
#extern
fun<>
StreamDemo2_stream_name
  ((*void*)): string
impltmp
<>(*tmp*)
StreamDemo2_stream_name
( ) = "StreamDemo2_stream_name()"
(* ****** ****** *)
#extern
fun<>
StreamDemo2_input_descript
  ((*void*)): string
impltmp
<>(*tmp*)
StreamDemo2_input_descript
( ) = "StreamDemo2_input_descript()"
(* ****** ****** *)
#extern
fun<>
StreamDemo2_stream
 ( (*void*) ): stream(item)
(* ****** ****** *)
//
#extern
fun<>
StreamDemo2_pauseq
( opt: optn(item) ) : bool
//
impltmp
<>(*tmp*)
StreamDemo2_pauseq(opt) = false
//
(* ****** ****** *)
//
#extern
fun<>
StreamDemo2_xprint
( opt: optn(item) ) : void
//
impltmp
<>(*tmp*)
StreamDemo2_xprint
  (opt) = () where
{
  val () =
  println("StreamDemo2_xprint(", opt, ")")
}
//
(* ****** ****** *)

(* end of [StreamDemo2.dats] *)
