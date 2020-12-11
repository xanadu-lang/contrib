######
#
# Makefile for QueenPuzzle
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
QueenPuzzle.html
QueenPuzzle.html:: ; \
$(SED) -f myscript.sed ./../template2.html > QueenPuzzle.html
######
QueenPuzzle_dats.js:: ; \
$(XATS2JS) --output-w QueenPuzzle_dats.js -d ./QueenPuzzle.dats
######
test:: \
QueenPuzzle_script_dats.js
QueenPuzzle_script_dats.js:: ; \
$(CAT) QueenPuzzle.cats > QueenPuzzle_script_dats.js && \
$(CAT) $(XATS2JS_PRELUDE) >> QueenPuzzle_script_dats.js && \
$(XATS2JS) 1>/dev/null 2>&1 --output-a QueenPuzzle_script_dats.js -d ./QueenPuzzle.dats
######
clean:: ; rm -f *~
######
cleanall:: clean
cleanall:: ; rm -f output
cleanall:: ; rm -f *_dats.js
cleanall:: ; rm -f QueenPuzzle.html
######
# export XATS2JSD=${XATS2JSD}
# export XATSHOME=$(XATS2JSD)/xatsopt
######

############ end of [Makefile] ############
