/* ****** ****** */
{
document.title =
the_StreamDemo2_title();
}
//
{
let
myelmnt =
document.getElementById
("StreamDemo2_stream_name");
myelmnt.innerHTML =
the_StreamDemo2_stream_name();
}
//
{
let
myelmnt =
document.getElementById
("StreamDemo2_input_descript");
myelmnt.innerHTML =
the_StreamDemo2_input_descript();
}
//
/* ****** ****** */
function
the_StreamDemo2_display_update()
{
let
output =
XATS2JS_the_print_store_join();
XATS2JS_the_print_store_clear();
the_StreamDemo2_display.innerHTML = output;
}
let
the_StreamDemo2_display =
document.getElementById("StreamDemo2_display");
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
StreamDemo2_button_start =
document.getElementById("StreamDemo2_button_start");
let
StreamDemo2_button_reset =
document.getElementById("StreamDemo2_button_reset");
let
StreamDemo2_button_pause =
document.getElementById("StreamDemo2_button_pause");
let
StreamDemo2_button_next1 =
document.getElementById("StreamDemo2_button_next1");
let
StreamDemo2_button_prev1 =
document.getElementById("StreamDemo2_button_prev1");
let
StreamDemo2_button_resume =
document.getElementById("StreamDemo2_button_resume");
//
/* ****** ****** */
//
function
StreamDemo2_control_init()
{
button_enable(StreamDemo2_button_start);
button_enable(StreamDemo2_button_next1);
//
button_disable(StreamDemo2_button_reset);
button_disable(StreamDemo2_button_prev1);
button_disable(StreamDemo2_button_pause);
button_disable(StreamDemo2_button_resume);
//
} // end of [StreamDemo2_control_init]
//
{
let _void_ = StreamDemo2_control_init();
}
//
/* ****** ****** */

var
the_StreamDemo2_auto = 0;
var
the_StreamDemo2_delay = 100;

/* ****** ****** */

function
StreamDemo2_control_auto()
{
if
(the_StreamDemo2_auto > 0)
{
let opt =
the_StreamDemo2_next1();
the_StreamDemo2_xprint(opt);
the_StreamDemo2_display_update();
//
let
my_ftimeout = function()
{
if
(
false===
the_StreamDemo2_pauseq(opt)
)
{
  StreamDemo2_control_auto( );
}
else
{
  alert("StreamDemo2_Paused!");
  StreamDemo2_control_pause( );
}
} ; // end of [my_ftimeout]
setTimeout
(my_ftimeout, the_StreamDemo2_delay);
}
} // end of [StreamDemo2_control_auto]

/* ****** ****** */

function
StreamDemo2_control_start()
{
/*
alert("StreamDemo2_control_start");
*/
//
the_StreamDemo2_auto = 1;
StreamDemo2_control_auto();
//
button_enable(StreamDemo2_button_reset);
button_enable(StreamDemo2_button_pause);
//
button_disable(StreamDemo2_button_start);
button_disable(StreamDemo2_button_next1);
button_disable(StreamDemo2_button_prev1);
button_disable(StreamDemo2_button_resume);
//
} // end of [StreamDemo2_control_start]

/* ****** ****** */

function
StreamDemo2_control_reset()
{
/*
alert("StreamDemo2_control_reset");
*/
//
the_StreamDemo2_auto = 0;
//
let
text = "The stream is reset!";
XATS2JS_the_print_store_clear();
the_StreamDemo2_display.innerHTML = text;
//
let _void1_ = the_StreamDemo2_reset();
//
let _void2_ = StreamDemo2_control_init();
//
} // end of [StreamDemo2_control_reset]

/* ****** ****** */

function
StreamDemo2_control_pause()
{
/*
alert("StreamDemo2_control_pause");
*/
//
the_StreamDemo2_auto = 0;
//
button_enable(StreamDemo2_button_reset);
button_enable(StreamDemo2_button_next1);
button_enable(StreamDemo2_button_prev1);
button_enable(StreamDemo2_button_resume);
//
button_disable(StreamDemo2_button_pause);
//
} // end of [StreamDemo2_control_pause]

/* ****** ****** */

function
StreamDemo2_control_next1()
{
/*
alert("StreamDemo2_control_next1");
*/
//
let opt =
the_StreamDemo2_next1();
the_StreamDemo2_xprint(opt);
the_StreamDemo2_display_update();
//
button_enable(StreamDemo2_button_reset);
button_enable(StreamDemo2_button_prev1);
//
if
(
true===
the_StreamDemo2_pauseq(opt)
)
{
setTimeout
(function(){alert("StreamDemo2_Paused!");}, 0);
}
} // end of [StreamDemo2_control_next1]

/* ****** ****** */

function
StreamDemo2_control_prev1()
{
/*
alert("StreamDemo2_control_prev1");
*/
//
let opt =
the_StreamDemo2_prev1();
the_StreamDemo2_xprint(opt);
the_StreamDemo2_display_update();
//
button_enable(StreamDemo2_button_reset);
button_enable(StreamDemo2_button_next1);
//
} // end of [StreamDemo2_control_prev1]

/* ****** ****** */

function
StreamDemo2_control_resume()
{
/*
alert("StreamDemo2_control_resume");
*/
//
the_StreamDemo2_auto = 1;
StreamDemo2_control_auto();
//
button_enable(StreamDemo2_button_reset);
button_enable(StreamDemo2_button_pause);
//
button_disable(StreamDemo2_button_next1);
button_disable(StreamDemo2_button_prev1);
button_disable(StreamDemo2_button_resume);
//
} // end of [StreamDemo2_control_resume]

/* ****** ****** */

/* end of [StreamDemo2.cats] */
