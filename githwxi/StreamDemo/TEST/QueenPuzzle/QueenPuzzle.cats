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
//
function
QueenPuzzle_control_init()
{
button_enable(QueenPuzzle_button_start);
button_enable(QueenPuzzle_button_next1);
//
button_disable(QueenPuzzle_button_reset);
button_disable(QueenPuzzle_button_prev1);
button_disable(QueenPuzzle_button_pause);
button_disable(QueenPuzzle_button_resume);
//
} // end of [QueenPuzzle_control_init]
//
{
let _void_ = QueenPuzzle_control_init();
}
//
/* ****** ****** */

function
QueenPuzzle_control_start()
{
//
alert("QueenPuzzle_control_start");
//
button_enable(QueenPuzzle_button_reset);
button_enable(QueenPuzzle_button_pause);
//
button_disable(QueenPuzzle_button_start);
button_disable(QueenPuzzle_button_next1);
button_disable(QueenPuzzle_button_prev1);
button_disable(QueenPuzzle_button_resume);
//
} // end of [QueenPuzzle_control_start]

/* ****** ****** */

function
QueenPuzzle_control_reset()
{
let _void_ = QueenPuzzle_control_init();
} // end of [QueenPuzzle_control_reset]

/* ****** ****** */

function
QueenPuzzle_control_pause()
{
//
alert("QueenPuzzle_control_pause");
//
button_enable(QueenPuzzle_button_reset);
button_enable(QueenPuzzle_button_next1);
button_enable(QueenPuzzle_button_prev1);
button_enable(QueenPuzzle_button_resume);
//
button_disable(QueenPuzzle_button_pause);
//
} // end of [QueenPuzzle_control_pause]

/* ****** ****** */

function
QueenPuzzle_control_next1()
{
alert("QueenPuzzle_control_next1");
}

function
QueenPuzzle_control_prev1()
{
alert("QueenPuzzle_control_prev1");
}

/* ****** ****** */

function
QueenPuzzle_control_resume()
{
//
alert("QueenPuzzle_control_resume");
//
button_enable(QueenPuzzle_button_reset);
button_enable(QueenPuzzle_button_pause);
//
button_disable(QueenPuzzle_button_next1);
button_disable(QueenPuzzle_button_prev1);
button_disable(QueenPuzzle_button_resume);
//
} // end of [QueenPuzzle_control_resume]

/* ****** ****** */

/* end of [QueenPuzzle.cats] */
