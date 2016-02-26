all : nlpp.pdf
.PHONY : all



NUWEB=../env/bin/nuweb
.SUFFIXES: .pdf .w .tex .html .aux .log .php

FIGFILES=fileschema directorystructure

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

$(htmldir)/% : % $(htmldir)
	cp $< $(htmldir)/



nuweb: $(NUWEB)

$(NUWEB): ../nuweb-1.58
	mkdir -p ../env/bin
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


clean:
	rm -rf $pipesocket/server-jre-7u72-linux-x64.tar.gz
	rm -rf ../env/apache-maven-3.0.5
	cd $piperoot
	mv /mnt/sdb1/nlpp/installed_modules old.modulelist
	cat old.modulelist | gawk '/maven_installed/ {next}; {print}' >/mnt/sdb1/nlpp/installed_modules
	
	rm -rf $snapshotsocket/t_nlpp_resources/Alpino-x86_64-linux-glibc2.5-20706-sicstus.tar.gz
	rm -rf ../nuweb-1.58
	

pdf : nlpp.pdf

print : nlpp.pdf
	lpr nlpp.pdf

view : nlpp.pdf
	evince nlpp.pdf

nlpp.pdf : nlpp.w $(W2PDF)  $(PDF_FIG_NAMES) $(PDFT_NAMES)
	chmod 775 $(W2PDF)
	$(W2PDF) $*

htm : $(htmldir) $(htmltarget)

DIRS = ../modules ../bin ../env/bin ../env/lib ../env/etc ../env/java ../env/java/jars ../env/apache-maven-3.0.5 ../env/python ../nuweb/bin 

$(DIRS) : 
	$(MKDIR) $@

sources : nlpp.w $(DIRS) $(NUWEB)
	$(NUWEB) nlpp.w
	chmod 775  ../bin/install-modules
	chmod 775  ../bin/check_start_spotlight
	chmod -R 775  ../bin/*
	chmod -R 775  ../env/bin/*
	

transplant :
	touch a_nlpp.w
	$(MAKE) sources
	../env/bin/transplant


