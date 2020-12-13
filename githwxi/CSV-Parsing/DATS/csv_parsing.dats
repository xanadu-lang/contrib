(* ****** ****** *)
#staload
"./../SATS/csv_parsing.sats"
(* ****** ****** *)
//
impltmp
<>(*tmp*)
csv_parse_line$comma() =
$UN.cast{sintgte(1)}(sint(','))
//
(*
//
// HX: for TSV-parsing
//
impltmp
<>(*tmp*)
csv_parse_line$comma() =
$UN.cast{sintgte(1)}(sint('\t'))
*)
//
(* ****** ****** *)
//
impltmp
<>(*tmp*)
csv_parse_line$dquot() =
$UN.cast{sintgte(1)}(sint('"'))
//
(* ****** ****** *)

(* end of [csv_parsing.dats] *)