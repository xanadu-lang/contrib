######
#
# Makefile for Fibonacci
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
PrimeNums.html
PrimeNums.html:: ; \
$(SED) -f myscript.sed ./../template1.html > PrimeNums.html
######
PrimeNums_dats.js:: ; \
$(XATS2JS) --output-w PrimeNums_dats.js -d ./PrimeNums.dats
######
test:: \
PrimeNums_script_dats.js
PrimeNums_script_dats.js:: ; \
$(CAT) PrimeNums.cats > PrimeNums_script_dats.js && \
$(CAT) $(XATS2JS_PRELUDE) >> PrimeNums_script_dats.js && \
$(XATS2JS) 1>/dev/null 2>&1 --output-a PrimeNums_script_dats.js -d ./PrimeNums.dats
######
clean:: ; rm -f *~
######
cleanall:: clean
cleanall:: ; rm -f output
cleanall:: ; rm -f *_dats.js
cleanall:: ; rm -f PrimeNums.html
######
# export XATS2JSD=${XATS2JSD}
# export XATSHOME=$(XATS2JSD)/xatsopt
######

############ end of [Makefile] ############
