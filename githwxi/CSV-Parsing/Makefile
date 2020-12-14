######
#
# Makefile for StreamDemo2
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
test:: \
csv_parsing_dats
csv_parsing_dats:: ; $(XATS2JS) -d DATS/csv_parsing.dats
######
clean:: ; rm -f *~
######
cleanall:: clean
cleanall:: ; rm -f output
cleanall:: ; rm -f *_dats.js
######
# export XATS2JSD=${XATS2JSD}
# export XATSHOME=$(XATS2JSD)/xatsopt
######

############ end of [Makefile] ############
