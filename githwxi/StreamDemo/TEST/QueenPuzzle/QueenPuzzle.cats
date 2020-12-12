/* ****** ****** */
let
QueenPuzzle_display =
document.getElementById("QueenPuzzle_display");
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

var theAuto = 0;
var theDelay = 100;

/* ****** ****** */

function
QueenPuzzle_control_auto()
{
if
(theAuto > 0)
{
let opt =
theQueenPuzzleDemo_next1();
theQueenPuzzleDemo_print(opt);
let output =
XATS2JS_the_print_store_join();
XATS2JS_the_print_store_clear();
QueenPuzzle_display.innerHTML = output;
//
let
my_ftimeout = function()
{
if
(
false===
theQueenPuzzleDemo_solq(opt)
)
{
  QueenPuzzle_control_auto( );
}
else
{
  QueenPuzzle_control_pause( );
  alert("A solution is found!");
}
} ; // end of [my_ftimeout]
setTimeout(my_ftimeout, theDelay);
}
} // end of [QueenPuzzle_control_auto]

/* ****** ****** */

function
QueenPuzzle_control_start()
{
/*
alert("QueenPuzzle_control_start");
*/
//
theAuto = 1;
QueenPuzzle_control_auto();
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
/*
alert("QueenPuzzle_control_reset");
*/
//
let
output = "The stream is reset!";
XATS2JS_the_print_store_clear();
QueenPuzzle_display.innerHTML = output;
//
let _void1_ = theQueenPuzzleDemo_reset();
//
let _void2_ = QueenPuzzle_control_init();
//
} // end of [QueenPuzzle_control_reset]

/* ****** ****** */

function
QueenPuzzle_control_pause()
{
/*
alert("QueenPuzzle_control_pause");
*/
//
theAuto = 0;
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
/*
alert("QueenPuzzle_control_next1");
*/
//
let opt =
theQueenPuzzleDemo_next1();
theQueenPuzzleDemo_print(opt);
let output =
XATS2JS_the_print_store_join();
XATS2JS_the_print_store_clear();
QueenPuzzle_display.innerHTML = output;
//
button_enable(QueenPuzzle_button_reset);
button_enable(QueenPuzzle_button_prev1);
//
if
(
true===
theQueenPuzzleDemo_solq(opt)
)
{
setTimeout
(function(){alert("A solution is found!");}, 0);
}
} // end of [QueenPuzzle_control_next1]

/* ****** ****** */

function
QueenPuzzle_control_prev1()
{
/*
alert("QueenPuzzle_control_prev1");
*/
//
let opt =
theQueenPuzzleDemo_prev1();
theQueenPuzzleDemo_print(opt);
let output =
XATS2JS_the_print_store_join();
XATS2JS_the_print_store_clear();
QueenPuzzle_display.innerHTML = output;
//
button_enable(QueenPuzzle_button_reset);
button_enable(QueenPuzzle_button_next1);
//
} // end of [QueenPuzzle_control_prev1]

/* ****** ****** */

function
QueenPuzzle_control_resume()
{
/*
alert("QueenPuzzle_control_resume");
*/
//
theAuto = 1;
QueenPuzzle_control_auto();
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
