######
#
# Makefile for HanoiTower
#
######
SED=sed
CAT=cat
CPF=cp -f
ECHO=echo
######
SHARE="${XATS2JSD}/share"
XATS2JS="${XATS2JSD}/bin/xats2js"
######
XATS2JS_PRELUDE=\
"$(SHARE)/runtime/xats2js_prelude.js"
XATS2JS_XATSLIB_NODE=\
"$(SHARE)/runtime/xats2js_xatslib_node.js"
######
test:: \
HanoiTower.html
HanoiTower.html:: ; \
$(SED) -f myscript.sed ./../template2.html > HanoiTower.html
######
test:: \
HanoiTower_script_dats.js
HanoiTower_script_dats.js:: ; \
$(CAT) HanoiTower.cats > HanoiTower_script_dats.js # && \
# $(CAT) $(XATS2JS_PRELUDE) >> HanoiTower_script_dats.js && \
# $(XATS2JS) 1>/dev/null 2>&1 --output-a HanoiTower_script_dats.js -d ./HanoiTower.dats
######
clean:: ; rm -f *~
######
cleanall:: clean
cleanall:: ; rm -f output
cleanall:: ; rm -f *_dats.js
cleanall:: ; rm -f HanoiTower.html
######
# export XATS2JSD=${XATS2JSD}
# export XATSHOME=$(XATS2JSD)/xatsopt
######

############ end of [Makefile] ############
