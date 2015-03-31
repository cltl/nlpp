all : nlpp.pdf
.PHONY : all



.SUFFIXES: .pdf .w .tex .html .aux .log .php

NUWEB=./nuweb
FIGFILES=fileschema

FIGFILENAMES=$(foreach fil,$(FIGFILES), $(fil).fig)
PDFT_NAMES=$(foreach fil,$(FIGFILES), $(fil).pdftex_t)
PDF_FIG_NAMES=$(foreach fil,$(FIGFILES), $(fil).pdftex)
PST_NAMES=$(foreach fil,$(FIGFILES), $(fil).pstex_t)
PS_FIG_NAMES=$(foreach fil,$(FIGFILES), $(fil).pstex)

W2PDF=../nuweb/bin/w2pdf
htmldir=../nuweb/html
htmlsource=nlpp.w nlpp.bib html.sty artikel3.4ht w2html
htmlmaterial=$(foreach fil, $(htmlsource), $(htmldir)/$(fil))
htmltarget=$(htmldir)/nlpp.html
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

$(htmldir)/% : % $(htmldir)
	cp $< $(htmldir)/


$(NUWEB): ../nuweb-1.58
	cd ../nuweb-1.58 && make nuweb
	cp ../nuweb-1.58/nuweb $(NUWEB)

../nuweb-1.58:
	cd .. && wget http://kyoto.let.vu.nl/~huygen/nuweb-1.58.tgz
	cd .. &&  tar -xzf nuweb-1.58.tgz

m4_nlpp.w : a_nlpp.w
	gawk '{if(match($$0, "@%")) {printf("%s", substr($$0,1,RSTART-1))} else print}' a_nlpp.w \
          | gawk '{gsub(/[\\][\$$]/, "$$");print}'  > m4_nlpp.w

nlpp.w : m4_nlpp.w inst.m4
	m4 -P m4_nlpp.w > nlpp.w

bibfile : nlpp.aux /home/paul/bin/mkportbib
	/home/paul/bin/mkportbib nlpp litprog

.PHONY : bibfile
$(W2PDF) : nlpp.w $(NUWEB)
	$(NUWEB) nlpp.w
$(htmldir) : 
	mkdir -p $(htmldir)

$(htmltarget) : $(htmlmaterial) $(htmldir) 
	cd $(htmldir) && chmod 775 w2html
	cd $(htmldir) && ./w2html nlpp.w


pdf : nlpp.pdf

print : nlpp.pdf
	lpr nlpp.pdf

view : nlpp.pdf
	evince nlpp.pdf

htm : $(htmldir) $(htmltarget)

DIRS = ../modules ../bin ../env/usrlocal/bin../env/usrlocal/bin ../env/usrlocal/lib ../modules/python ../env/java ../env/java ../env/java/jars /home/paul/projecten/cltl/pipelines/nlpp/env/apache-maven-3.0.5 /home/paul/projecten/cltl/pipelines/nlpp/env/python ../nuweb/bin 

$(DIRS) : 
	$(MKDIR) $@

sources : nlpp.w $(DIRS) $(NUWEB)
	$(NUWEB) nlpp.w
	chmod -R 775  ../bin/*



