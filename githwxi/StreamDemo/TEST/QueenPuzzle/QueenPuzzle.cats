/* ****** ****** */
//
function
button_disable(button)
{
  button.disabled=true; return;
}
function
button_enable(button)
{
  button.disabled=false; return;
}
//
let
QueenPuzzle_button_start =
document.getElementById("QueenPuzzle_button_start");
let
QueenPuzzle_button_reset =
document.getElementById("QueenPuzzle_button_reset");
let
QueenPuzzle_button_pause =
document.getElementById("QueenPuzzle_button_pause");
let
QueenPuzzle_button_next1 =
document.getElementById("QueenPuzzle_button_next1");
let
QueenPuzzle_button_prev1 =
document.getElementById("QueenPuzzle_button_prev1");
let
QueenPuzzle_button_resume =
document.getElementById("QueenPuzzle_button_resume");
//
/* ****** ****** */
var _void_ = button_enable(QueenPuzzle_button_start);
var _void_ = button_disable(QueenPuzzle_button_reset);
var _void_ = button_disable(QueenPuzzle_button_next1);
var _void_ = button_disable(QueenPuzzle_button_prev1);
var _void_ = button_disable(QueenPuzzle_button_pause);
var _void_ = button_disable(QueenPuzzle_button_resume);
/* ****** ****** */

/* end of [QueenPuzzle.cats] */
