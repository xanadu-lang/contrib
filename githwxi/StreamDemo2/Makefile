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
SOURCE=.
TARGET=./TARGET
######
StreamDemo2_html=\
$(TARGET)/StreamDemo2_html
StreamDemo2_script_dats_js=\
$(TARGET)/StreamDemo2_script_dats.js
######
# test:: \
# StreamDemo2.html
# StreamDemo2.html:: ; \
# $(CPF) $(SOURCE)/StreamDemo2.html $(TARGET)/StreamDemo2.html
######
# test::
# StreamDemo2_dats_js:: ; $(XATS2JS) -d $(SOURCE)/StreamDemo2.dats
######
# test:: \
# StreamDemo2_script_dats_js
# StreamDemo2_script_dats_js:: ; \
# $(CAT) $(SOURCE)/StreamDemo2.cats >> $(TARGET)/StreamDemo2_script_dats.js && \
# $(XATS2JS) 1>/dev/null 2>&1 --output-a $(TARGET)/StreamDemo2_script_dats.js -d $(SOURCE)/StreamDemo2.dats
######
clean:: ; rm -f *~
######
cleanall:: clean
cleanall:: ; rm -f output
cleanall:: ; rm -f *_dats.js
cleanall:: ; rm -f $(TARGET)/StreamDemo2.html
cleanall:: ; rm -f $(TARGET)/StreamDemo2_script_dats.js
######
# export XATS2JSD=${XATS2JSD}
# export XATSHOME=$(XATS2JSD)/xatsopt
######

############ end of [Makefile] ############
