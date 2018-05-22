PAPER=thesis
BIBS=refs.bib
FIGS=Figure/*.eps
TEX=*.tex
STY=*.sty

$(PAPER).pdf: *.tex $(BIBS) 
	latex $(PAPER).tex
	latex $(PAPER).tex
	bibtex $(PAPER)
	latex $(PAPER).tex
	latex $(PAPER).tex
	dvips $(PAPER).dvi
#	ps2pdf $(PAPER).ps
	ps2pdf -dEmbedAllFonts=true -dSubsetFonts=true -dEPSCrop=true -dPDFSETTINGS=/prepress $(PAPER).ps
	-rm -f *.aux *.bbl *.blg *.dvi *.end *.log *.ps *.lof *.lot *.toc 

TARFLIST = $$ME/makefile \
$$ME/refs.bib \
$$ME/$(TEX) \
$$ME/$(SECS) \
$$ME/$(FIGS) \
$$ME/$(STY) \

clean:
	-rm -f *.aux *.bbl *.blg *.dvi *.end *.log *.ps *.lof *.lot *.toc $(PAPER).pdf

tar:
	cd ./ && ME=`basename $$PWD` && cd .. && tar -cf "`date +$(PAPER)_%m_%d_%y.tar`" ${TARFLIST} && \
	gzip "`date +$(PAPER)_%m_%d_%y.tar`" && mv `date +$(PAPER)_%m_%d_%y.tar`.gz $$ME/.
