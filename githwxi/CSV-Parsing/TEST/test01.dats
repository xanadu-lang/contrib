(* ****** ****** *)
#staload CSV =
"./../SATS/csv_parsing.sats"
(* ****** ****** *)
#staload _(*CSV*) =
"./../DATS/csv_parsing.dats"
(* ****** ****** *)
#include"\
$(XATS2JSD)\
/share/xats2js_prelude.hats"
(* ****** ****** *)
#staload
"xatslib/libc/DATS/fpath.dats"
(* ****** ****** *)
#staload _ =
"prelude\
/DATS/CATS/JS/Node/g_print.dats"
(* ****** ****** *)
#staload _ =
"xatslib\
/libc/DATS/CATS/JS/Node/basics.dats"
(* ****** ****** *)
implfun
{a:vt} // HX: This is
g_free<a>(x0) = () // for JS!!!
(* ****** ****** *)

val () =
let
val
lines =
fpath_streamize_line_vt
("./DATA/QQQ-2020-12-14.csv")
val
lines =
$CSV.stream_vt_csv_line_repair(lines)
in
(
iforeach0(lines)
) where
{
  impltmp
  iforeach0$work
  <string_vt>
  (i0, line) =
  let
    var nerr: int = 0
    val
    line = string_vt2t(line)
    val
    items =
    $CSV.csv_parse_line_nerr(line, nerr)
    fun
    print_items(xs) =
    (
    case+ xs of
    | ~list_vt_nil() => ()
    | ~list_vt_cons(x0, xs) =>
       (
       print_items(xs)) where
       {
       val () = println(string_vt2t(x0))
       }
    )
  in
    println("line#", i0, ":"); print_items(items)
  end
}
end (* let *) // end-of-val

(* ****** ****** *)

(* end of [test01.dats] *)
