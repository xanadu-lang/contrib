######
#
# A simple Makefile
#
######
CAT=cat
CPF=cp -f
ECHO=echo
MAKE=make
NODE=node
######
XATS2JS=$(XATS2JSD)/bin/xats2js
######
XATS2JS_PRELUDE=\
"$(XATS2JSD)/share/runtime/xats2js_prelude.js"
XATS2JS_PRELUDE_NODE=\
"$(XATS2JSD)/share/runtime/xats2js_prelude_node.js"
XATS2JS_XATSLIB_NODE=\
"$(XATS2JSD)/share/runtime/xats2js_xatslib_node.js"
######
test:: \
test01
test01:: ; \
$(CAT) $(XATS2JS_PRELUDE) > test01_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> test01_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> test01_dats.js && \
$(XATS2JS) 1>/dev/null 2>&1 --output-a test01_dats.js -d ./test01.dats && $(NODE) test01_dats.js
######
#
# HX: for cleaning up
#
######
clean:: ; rm -f *~
######
cleanall:: clean
cleanall:: ; rm -f output
cleanall:: ; rm -f *_dats.js
######
# export XATS2JSD=./../../..
# export XATSHOME=$(XATS2JSD)/xatsopt
###### end of [Makefile] ######
