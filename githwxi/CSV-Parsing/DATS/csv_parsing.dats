(* ****** ****** *)
#staload
UN =
"prelude/SATS/unsafe.sats"
(* ****** ****** *)
#staload
"./../SATS/csv_parsing.sats"
(* ****** ****** *)
//
impltmp
<>(*tmp*)
csv_parse_line$comma
((*void*)) =
$UN.cast01
{sintgte(1)}(sint(','))
//
(*
//
// HX: for TSV-parsing
//
impltmp
<>(*tmp*)
csv_parse_line$comma
((*void*)) =
$UN.cast01
{sintgte(1)}(sint('\t'))
*)
//
(* ****** ****** *)
//
impltmp
<>(*tmp*)
csv_parse_line$dquot
((*void*)) =
$UN.cast01
{sintgte(1)}( sint('"') )
//
(* ****** ****** *)

implement
<>(*tmp*)
csv_parse_line_opt
  (line) =
let
//
var
nerr: int = 0
//
val itms =
csv_parse_line_nerr(line, nerr)
//
in
if
(nerr <= 0)
then
optn_vt_cons(itms)
else
let
val () =
free(itms) in optn_vt_nil()
end // end of [else] // end-of-if
end // end of [csv_parse_line_opt]

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
#extern
fun<>
getpos(): int
//
#extern
fun<>
is_end(): bool
//
#extern
fun<>
char_get0(): int
#extern
fun<>
char_get1(): int
#extern
fun<>
char_incby1(): void
#extern
fun<>
char_getinc(): int
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
val p_i = $addr(_i_)
//
fun
get_i() =
$UN.p2tr_get(p_i)
and
inc_i() = let
val i0 =
  $UN.p2tr_get(p_i)
in
$UN.p2tr_set(p_i, i0+1)
end
and
set_i(i0) =
$UN.p2tr_set(p_i, i0+0)
//
(* ****** ****** *)
//
val len0 = length(line)
//
(* ****** ****** *)
//
fun
sintgte_check
{n:int}
( x
: sint
, n
: sint(n))
: sintgte(n) = (x)
//
(* ****** ****** *)
impltmp
getpos<>() = get_i()
//
impltmp
is_end<>() = get_i() >= len0
//
(* ****** ****** *)
impltmp
char_get0<>() =
let
val
i0 = get_i()
val
i0 =
sintgte_check(i0, 0)
//
in
if
(i0 < len0)
then
char_ord(line[i0]) else (-1)
end
(* ****** ****** *)
impltmp
char_get1<>() =
let
val
i0 = get_i()
val
i1 =
sintgte_check(i0+1, 0)
//
in
if
(i1 < len0)
then
char_ord(line[i1]) else (-1)
end
(* ****** ****** *)

impltmp
char_getinc<>() =
let
//
val i0 = get_i()
//
val i0 =
sintgte_check(i0, 0)
//
in
if
(i0 < len0)
then
( inc_i()
; char_ord(line[i0])) else (-1)
end // end of [char_getinc]

(* ****** ****** *)
//
val
COMMA = csv_parse_line$comma<>()
and
DQUOT = csv_parse_line$dquot<>()
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

vwtpdef
chars_vt = list_vt(char)

(* ****** ****** *)
//
fun
string_vt_sbfmk(cs) =
string_vt_make_list_vt
  ( list_vt_reverse(cs) )
//
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
( sbf0
: chars_vt 
, nerr
: &int >> int
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

vwtpdef
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
  res0 = parse_itemlst(nerr)
  in
  list_vt_reverse<string_vt>(res0)
  end
end // end of [csv_parse_line_nerr]
//
(* ****** ****** *)

end // end of [local] // for [csv_parse_line_nerr]

(* ****** ****** *)
//
(*
#extern
fun{}
stream_vt_csv_line_repair
( lines
: stream_vt(string_vt)): stream_vt(string_vt)
*)
//
local
//
#define
char_chr
char_make_sint
#define
char_ord
sint_make_char
//
in(*in-of-local*)

impltmp
<>(*tmp*)
stream_vt_csv_line_repair
  (xs) =
( aux0(xs) ) where
{
//
val
DQUOT =
csv_parse_line$dquot<>()
//
fun
string_ncs
(cs: !string_vt): int =
(
glseq_foldl1(cs, 0)
) where
{
  typedef x0 = char
  typedef r0 = sint
  impltmp
  foldl1$fopr<x0><r0>
  (r, c) =
  if char_ord(c) != DQUOT then r else r+1
}
//
fun
isevn
( cs
: !string_vt): bool = (string_ncs(cs) % 2 = 0)
fun
isodd
( cs
: !string_vt): bool = (string_ncs(cs) % 2 != 0)
//
fun
aux0
( xs
: stream_vt(string_vt)
) : stream_vt(string_vt) =
$llazy
(
$free(xs);
case+ !xs of
| ~
strmcon_vt_nil
  () => strmcon_vt_nil()
| ~
strmcon_vt_cons
  (x0, xs) => !(aux1(x0, xs))
)
and
aux1
( x0: string_vt
, xs
: stream_vt(string_vt)
) : stream_vt(string_vt) =
$llazy
(
free(x0); $free(xs);
(
if
isodd(x0)
then !(aux2(x0, xs))
else strmcon_vt_cons(x0, aux0(xs))
)
)
//
and
aux2
( x0: string_vt
, xs
: stream_vt(string_vt)
) : stream_vt(string_vt) =
let
fun
stradd
( x0
: string_vt
, x1
: string_vt): string_vt =
let
val
res =
string_vt_append(x0, x1)
in
//
let
val () = free(x0)
val () = free(x1) in res end
//
end
in
$llazy
(
free(x0); $free(xs);
case+ !xs of
| ~
strmcon_vt_nil() =>
strmcon_vt_sing(x0) // missing DQUOTE
| ~
strmcon_vt_cons(x1, xs) =>
(
  if
  isevn(x1)
  then
  (
    !(aux2(stradd(x0,x1), xs))
  )
  else
  let
    val x2 = stradd(x0,x1)
  in
    strmcon_vt_cons(x2, aux0(xs))
  end
)
)
end
//
} (* end of [stream_vt_csv_line_repair] *)

end // end of [local] // for [stream_vt_csv_line_repair]

(* ****** ****** *)

(* end of [csv_parsing.dats] *)
