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
HanoiTower_button_start =
document.getElementById("HanoiTower_button_start");
let
HanoiTower_button_reset =
document.getElementById("HanoiTower_button_reset");
let
HanoiTower_button_pause =
document.getElementById("HanoiTower_button_pause");
let
HanoiTower_button_next1 =
document.getElementById("HanoiTower_button_next1");
let
HanoiTower_button_prev1 =
document.getElementById("HanoiTower_button_prev1");
let
HanoiTower_button_resume =
document.getElementById("HanoiTower_button_resume");
//
/* ****** ****** */
var _void_ = button_enable(HanoiTower_button_start);
var _void_ = button_disable(HanoiTower_button_reset);
var _void_ = button_disable(HanoiTower_button_next1);
var _void_ = button_disable(HanoiTower_button_prev1);
var _void_ = button_disable(HanoiTower_button_pause);
var _void_ = button_disable(HanoiTower_button_resume);
/* ****** ****** */

/* end of [HanoiTower.cats] */
