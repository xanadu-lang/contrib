######
#
# Makefile for HanoiTower
#
######
CAT=cat
CPF=CP -f
RMF=rm -f
MAKE=make
######
SHARE="${XATS2JSD}/share"
XATS2JS="${XATS2JSD}/bin/xats2js"
######
XATS2JS_PRELUDE=\
$(SHARE)/runtime/xats2js_prelude.js
XATS2JS_PRELUDE_NODE=\
$(SHARE)/runtime/xats2js_prelude_node.js
XATS2JS_XATSLIB_NODE=\
$(SHARE)/runtime/xats2js_xatslib_node.js
######
TARGET=./TARGET
SOURCE=./../../../StreamDemo2
######
STREAMDEMO2_HTML=\
$(TARGET)/StreamDemo2.html
STREAMDEMO2_SCRIPT_DATS_JS=\
$(TARGET)/StreamDemo2_script_dats.js
######
# test:: ; \
# $(XATS2JS) -d ./HanoiTower.dats
######
# build:: ; \
# $(CAT) \
# $(SOURCE)/StreamDemo2.html > $(STREAMDEMO2_HTML)
######
build:: ; \
$(CAT) \
$(XATS2JS_PRELUDE) > $(STREAMDEMO2_SCRIPT_DATS_JS) && \
$(CAT) \
$(XATS2JS_PRELUDE_NODE) >> $(STREAMDEMO2_SCRIPT_DATS_JS)
build:: ; \
$(XATS2JS) 1>/dev/null 2>&1 \
--output-a $(STREAMDEMO2_SCRIPT_DATS_JS) -d ./HanoiTower.dats
######

cleanall:: ; $(RMF) $(TARGET)/StreamDemo2.html
cleanall:: ; $(RMF) $(TARGET)/StreamDemo2_script_dats.js

############ end of [Makefile] ############
