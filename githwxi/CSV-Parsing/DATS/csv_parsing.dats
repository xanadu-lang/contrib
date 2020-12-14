(* ****** ****** *)
#staload
"./../SATS/csv_parsing.sats"
(* ****** ****** *)
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

local
//
#define
char_chr
char_make_sint
#define
char_ord
sint_make_char
//
extern
fun<>
getpos(): int
//
extern
fun<>
is_end(): bool
//
extern
fun<>
char_get0(): int
extern
fun<>
char_get1(): int
extern
fun<>
char_incby1(): void
extern
fun<>
char_getinc(): int
//
extern
fun<>
sintgte_check
{n:int}
(int, n:int(n)): sintgte(n)
//
in (* in-of-local *)
//
impltmp
<>(*tmp*)
csv_parse_line_nerr
  (line, nerr) = let
//
var _i_: int = 0
//
val p_i = (addr@_i_)
//
fun
get_i() =
$UN.cptr_get(p_i)
and
inc_i() = let
val i0 =
  $UN.cptr_get(p_i)
in
$UN.cptr_set(p_i, i0+1)
end
and
set_i(i0) =
$UN.cptr_set(p_i, i0+0)
//
(* ****** ****** *)
//
val len0 = length(line)
//
(* ****** ****** *)

impltmp
getpos<>() = get_i()
//
impltmp
is_end<>() = get_i() >= len0
//
impltmp
char_get0<>() = let
  val i0 = get_i()
  val i0 = sintgte_check(i0, 0)
//
in
  if i0 < len0 then char_ord(line[i0]) else (~1)
end // end of [char_get0]
impltmp
char_get1<>() = let
  val i0 = get_i()
  val i1 = sintgte_check(i0+1, 0)
//
in
  if i1 < len0 then char_ord(line[i1]) else (~1)
end // end of [char_get1]
impltmp
char_getinc<>() = let
  val i0 = get_i()
  val i0 = sintgte_check(i0, 0)
//
in
  if i0 < len0 then (inc_i(); char_ord(line[i0])) else (~1)
end // end of [char_getinc]

(* ****** ****** *)

impltmp
<>(*tmp*)
sintgte_check(x, n) = x

(* ****** ****** *)
//
val
COMMA =
csv_parse_line$comma<>()
and
DQUOT =
csv_parse_line$dquot<>()
//
(* ****** ****** *)

fun
parse_char
(
c0: int
,
nerr: &int >> int
) : bool = let
//
val c1 = char_getinc()
//
in
//
if
(c1 >= 0)
then
(
if
(c0 = c1)
then true
else
( nerr := nerr + 1
; parse_char(c0, nerr))
) (* end of [else] *)
else (false)
//
end // end of [parse_char]

(* ****** ****** *)

vtypedef
chars_vt = list_vt(char)

fun
string_vt_sbfmk(cs) =
string_vt_make_rlist_vt(cs)

(* ****** ****** *)

fun
parse_item
( nerr
: &int >> int
) : string_vt = let
//
val c0 = char_get0()
val sbf = list_vt_nil()
//
in
//
if
(c0 != DQUOT)
then
(
  parse_item_loop1(sbf, nerr)
)
else
let
  val () = inc_i()
in
  parse_item_loop2(sbf, nerr)
end // end of [else]
//
end // end of [parse_item]

(* ****** ****** *)

and
parse_item_loop1
( sbf0: chars_vt 
, nerr: &int >> int
) : string_vt = let
//
val c1 =
  g1ofg0(char_get0())
//
in
//
if
(c1 >= 0)
then
(
//
if
(c1 != COMMA)
then
( inc_i();
  if
  (c1 > 0)
  then
  let
//
  val () =
  if
  (c1 = DQUOT)
  then
  (nerr := nerr + 1)
//
  val c1 = char_chr(c1)
  val sbf1 =
  list_vt_cons(c1, sbf0)
  in
    parse_item_loop1(sbf1, nerr)
  end
  else
  (
    parse_item_loop1(sbf0, nerr)
  )
) (* end of [then] *)
else string_vt_sbfmk(sbf0)
) (* end of [then] *)
else string_vt_sbfmk(sbf0)
//
end // end of [parse_item_loop1]

(* ****** ****** *)

and
parse_item_loop2
( sbf0
: chars_vt
, nerr: &int >> int
) : string_vt = let
//
val c1 = char_get0()
//
in
//
if
(c1 >= 0)
then
(
//
if
(c1 != DQUOT)
then
( inc_i();
  if
  (c1 > 0)
  then
  let
//
    val c1 =
    char_chr(c1)
//
    val sbf1 =
    list_vt_cons(c1, sbf0)
//
  in
    parse_item_loop2(sbf1, nerr)
  end
  else
  (
    parse_item_loop2(sbf0, nerr)
  )
) (* end of [then] *)
else
let
//
// c1 = DQUOT
//
  val c2 = char_get1()
in
  if
  (c2 != DQUOT)
  then let
    val () = inc_i()
  in
     string_vt_sbfmk(sbf0)
  end // end-of-then
  else
  (
    parse_item_loop2(sbf1, nerr)
  ) where
  {
//
// c2 = DQUOT  
//
    val () = inc_i()
    val () = inc_i()
    val c2 = char_chr(c2)
    val sbf1 = list_vt_cons(c2, sbf0)
  } // end of [else]
end // end of [else]
) (* end of [then] *)
else
let
val () = (nerr := nerr+1) in string_vt_sbfmk(sbf0)
end // end of [else]
//
end // end of [parse_item_loop2]

(* ****** ****** *)

vtypedef
res_vt = list_vt(string_vt)

(* ****** ****** *)

fun
parse_itemlst
( nerr
: &int >> int): res_vt = let
//
fun
auxlst
( nerr: &int >> int
, res0: res_vt): res_vt = let
//
val c0 = char_get0()
//
in
//
if
(c0 >= 0)
then let
//
val itm =
  parse_item(nerr)
val res0 =
  list_vt_cons(itm, res0)
//
val more = parse_char(COMMA, nerr)
//
in
if more then auxlst(nerr, res0) else res0
end // end of [then]
else
(
let
val
itm =
string_vt_nil() in list_vt_cons(itm, res0)
end
) (* end of [else] *)
//
end // end of [auxlst]
//
in
//
if
(
char_get0() < 0
) then list_vt_nil((*void*))
  else auxlst(nerr, list_vt_nil((* res0 *)))
//
end // end of [parse_itemlst]

(* ****** ****** *)
//
in
let
val
res0 =
parse_itemlst(nerr) in list_vt_reverse<string_vt>(res0)
end
end // end of [csv_parse_line_nerr]
//
(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

(* end of [csv_parsing.dats] *)
