(* ****** ****** *)
//
// Author: Hongwei Xi
// Authoremail: gmhwxiATgmailDOTcom
// Start time: the 17th of July, 2016
//
(* ****** ****** *)
(*
HX:
Please find a detailed specification of CSV:
super-csv.github.io/super-csv/csv_specification.html
*)
(* ****** ****** *)
(*
// HX-2020-12-13:
// Porting to ATS3 starts
*)
(* ****** ****** *)
//
fun<>
csv_parse_line$comma(): sintgte(1)
fun<>
csv_parse_line$dquot(): sintgte(1)
//
(* ****** ****** *)
fun<>
csv_parse_line_nerr
( line: string
, nerr: &int >> _): list_vt(string_vt)
(* ****** ****** *)
//
// HX:
// For handling line-breaks
//
fun<>
stream_vt_csv_line_repair
( lines
: stream_vt(string_vt)): stream_vt(string_vt)
//
(* ****** ****** *)

(* end of [csv_parsing.sats] *)
