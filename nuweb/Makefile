all : dutch-nlp-modules-on-Lisa.pdf
.PHONY : all



NUWEB=/home/phuijgen/usrlocal/bin/nuweb

.SUFFIXES: .pdf .w .tex .html .aux .log .php

FIGFILES=fileschema

FIGFILENAMES=$(foreach fil,$(FIGFILES), $(fil).fig)
PDFT_NAMES=$(foreach fil,$(FIGFILES), $(fil).pdftex_t)
PDF_FIG_NAMES=$(foreach fil,$(FIGFILES), $(fil).pdftex)
PST_NAMES=$(foreach fil,$(FIGFILES), $(fil).pstex_t)
PS_FIG_NAMES=$(foreach fil,$(FIGFILES), $(fil).pstex)

W2PDF=../nuweb/bin/w2pdf
HTML_PS_FIG_NAMES=$(foreach fil,$(FIGFILES), m4_htmldocdir/$(fil).pstex)
HTML_PST_NAMES=$(foreach fil,$(FIGFILES), m4_htmldocdir/$(fil).pstex_t)
MKDIR = mkdir -p

 

%.eps: %.fig
	fig2dev -L eps $< > $@

%.pstex: %.fig
	fig2dev -L pstex $< > $@

.PRECIOUS : %.pstex
%.pstex_t: %.fig %.pstex
	fig2dev -L pstex_t -p $*.pstex $< > $@

%.pdftex: %.fig
	fig2dev -L pdftex $< > $@

.PRECIOUS : %.pdftex
%.pdftex_t: %.fig %.pstex
	fig2dev -L pdftex_t -p $*.pdftex $< > $@

%.pdf : %.w $(W2PDF)  $(PDF_FIG_NAMES) $(PDFT_NAMES)
	chmod 775 $(W2PDF)
	$(W2PDF) $*

m4_htmldocdir/%.pstex : %.pstex
	cp  $< $@

m4_htmldocdir/%.pstex_t : %.pstex_t
	cp  $< $@


m4_dutch-nlp-modules-on-Lisa.w : a_dutch-nlp-modules-on-Lisa.w
	gawk '{if(match($$0, "@%")) {printf("%s", substr($$0,1,RSTART-1))} else print}' a_dutch-nlp-modules-on-Lisa.w \
          | gawk '{gsub(/[\\][\$$]/, "$$");print}'  > m4_dutch-nlp-modules-on-Lisa.w

dutch-nlp-modules-on-Lisa.w : m4_dutch-nlp-modules-on-Lisa.w inst.m4
	m4 -P m4_dutch-nlp-modules-on-Lisa.w > dutch-nlp-modules-on-Lisa.w

bibfile : dutch-nlp-modules-on-Lisa.aux /home/paul/bin/mkportbib
	/home/paul/bin/mkportbib dutch-nlp-modules-on-Lisa litprog

.PHONY : bibfile
$(W2PDF) : dutch-nlp-modules-on-Lisa.w
	$(NUWEB) dutch-nlp-modules-on-Lisa.w
m4_htmlsource : dutch-nlp-modules-on-Lisa.w
	cp  dutch-nlp-modules-on-Lisa.w m4_htmlsource

m4_4htfildest : m4_4htfilsource
	cp m4_4htfilsource m4_4htfildest

m4_htmlbibfil : m4_anuwebdir/dutch-nlp-modules-on-Lisa.bib
	cp m4_anuwebdir/dutch-nlp-modules-on-Lisa.bib m4_htmlbibfil

m4_htmltarget : m4_htmlsource m4_4htfildest $(HTML_PS_FIG_NAMES) $(HTML_PST_NAMES) m4_htmlbibfil
	cp w2html /home/phuijgen/nlp/dutch-nlp-modules-on-Lisa/bin
	cd /home/phuijgen/nlp/dutch-nlp-modules-on-Lisa/bin && chmod 775 w2html
	cd m4_htmldocdir && /home/phuijgen/nlp/dutch-nlp-modules-on-Lisa/bin/w2html dutch-nlp-modules-on-Lisa.w


pdf : dutch-nlp-modules-on-Lisa.pdf

print : dutch-nlp-modules-on-Lisa.pdf
	lpr dutch-nlp-modules-on-Lisa.pdf

view : dutch-nlp-modules-on-Lisa.pdf
	evince dutch-nlp-modules-on-Lisa.pdf

html : m4_htmltarget

DIRS = /home/phuijgen/nlp/dutch-nlp-modules-on-Lisa/modules /home/phuijgen/nlp/dutch-nlp-modules-on-Lisa/bin /home/phuijgen/nlp/dutch-nlp-modules-on-Lisa/modules/usrlocal /home/phuijgen/nlp/dutch-nlp-modules-on-Lisa/modules/usrlocal/bin /home/phuijgen/nlp/dutch-nlp-modules-on-Lisa/modules/usrlocal/lib /home/phuijgen/nlp/dutch-nlp-modules-on-Lisa/modules/python /home/phuijgen/nlp/dutch-nlp-modules-on-Lisa/modules/jars /home/phuijgen/nlp/dutch-nlp-modules-on-Lisa/modules/alpinohack ../nuweb/bin 

$(DIRS) : 
	$(MKDIR) $@

sources : dutch-nlp-modules-on-Lisa.w $(DIRS)
	$(NUWEB) dutch-nlp-modules-on-Lisa.w
	chmod 775  /home/phuijgen/nlp/dutch-nlp-modules-on-Lisa/bin/install-modules
	chmod 775  /home/phuijgen/nlp/dutch-nlp-modules-on-Lisa/bin/tok
	chmod 775  /home/phuijgen/nlp/dutch-nlp-modules-on-Lisa/bin/mor
	chmod 775  /home/phuijgen/nlp/dutch-nlp-modules-on-Lisa/bin/alpinohack
	chmod 775  /home/phuijgen/nlp/dutch-nlp-modules-on-Lisa/bin/ner
	chmod 775  /home/phuijgen/nlp/dutch-nlp-modules-on-Lisa/bin/wsd
	chmod 775  /home/phuijgen/nlp/dutch-nlp-modules-on-Lisa/bin/onto
	chmod 775  /home/phuijgen/nlp/dutch-nlp-modules-on-Lisa/bin/heideltime
	chmod 775  /home/phuijgen/nlp/dutch-nlp-modules-on-Lisa/bin/srl
	chmod 775  /home/phuijgen/nlp/dutch-nlp-modules-on-Lisa/bin/test
	

jetty : sources
	cd .. && mvn jetty:run


