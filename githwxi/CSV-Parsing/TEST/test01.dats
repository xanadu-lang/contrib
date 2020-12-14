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
  <string>
  (i0, line) = println("(line#", i0, ")\t", line)
}
end (* let *) // end-of-val

(* ****** ****** *)

(* end of [test01.dats] *)
