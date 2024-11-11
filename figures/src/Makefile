DVIPS    = dvips
EPSTOPDF = epstopdf
GNUPLOT  = gnuplot
LATEX    = latex
METAPOST = mpost
PDFCROP  = pdfcrop
PDFLATEX = pdflatex -interaction=nonstopmode
PS2PDF   = ps2pdf

AXOPREF  = axo_
TIKZPREF = tikz_
GPPREF   = gp_
PSPREF   = ps_
TBLPREF  = tbl_
CROPMARG = 1

DEPS     = Makefile $(wildcard *.dat)
OUTDIR   = ..
AXOFIG   = $(patsubst %.axo,$(AXOPREF)%.pdf,$(wildcard *.axo))
TIKZFIG  = $(patsubst %.tikz,$(TIKZPREF)%.pdf,$(wildcard *.tikz))
FIGTBL   = $(patsubst %.table,$(TBLPREF)%.pdf,$(wildcard *.table))
GPFIG    = $(patsubst %.plt,$(GPPREF)%.pdf,$(wildcard *.plt))
PSFIG    = $(patsubst %.ps,$(PSPREF)%.pdf,$(filter-out $(PSPREF)%,$(wildcard *.ps)))
PSFIG   += $(patsubst %.eps,$(PSPREF)%.pdf,$(filter-out $(PSPREF)%,$(wildcard *.eps)))

all: $(AXOFIG) $(TIKZFIG) $(GPFIG) $(PSFIG) $(FIGTBL)

$(PSPREF)%.pdf: %.ps $(DEPS)
	$(PS2PDF) $< $@
	$(PDFCROP) --margin $(CROPMARG) $@ $@
	cp $@ $(OUTDIR)/

$(PSPREF)%.pdf: %.eps $(DEPS)
	$(EPSTOPDF) $< --outfile=$@
	$(PDFCROP) --margin $(CROPMARG) $@ $@
	cp $@ $(OUTDIR)/
	
$(GPPREF)%.pdf: %.plt common.gp $(DEPS)
	$(GNUPLOT) -e "set output 'tmp_$*_over.tex'" $< 
	$(EPSTOPDF) tmp_$*_over.eps --outfile=tmp_$*_over.pdf
	echo '\\documentclass[a4paper,12pt]{article}' >  tmp_$*.tex;\
	echo '\\usepackage[cm,empty]{fullpage}'    >> tmp_$*.tex;\
	echo '\\usepackage{graphicx,xcolor}'       >> tmp_$*.tex;\
	echo '\\usepackage{mathpazo,CrimsonPro}'   >> tmp_$*.tex;\
	echo '\\begin{document}'                   >> tmp_$*.tex;\
	echo '\\input{'"tmp_$*_over.tex"'}'        >> tmp_$*.tex;\
	echo '\\end{document}'                     >> tmp_$*.tex;\
	$(PDFLATEX) tmp_$*.tex;\
	mv tmp_$*.pdf $@;\
	rm -f tmp_$**
	$(PDFCROP) --margin $(CROPMARG) $@ $@
	cp $@ $(OUTDIR)/

$(AXOPREF)%.pdf: %.axo $(DEPS)
	echo '\\documentclass[a4paper,12pt]{article}'   >  tmp_$<.tex;\
	echo '\\usepackage[cm,empty]{fullpage}'         >> tmp_$<.tex;\
	echo '\\usepackage{mathpazo,CrimsonPro}'        >> tmp_$<.tex;\
	echo '\\usepackage{axodraw2,fp}'                >> tmp_$<.tex;\
	echo '\\begin{document}'                        >> tmp_$<.tex;\
	echo '\\input{'"$<"'}'                          >> tmp_$<.tex;\
	echo '\\end{document}'                          >> tmp_$<.tex;\
	$(PDFLATEX) tmp_$<.tex;\
	axohelp tmp_$<;\
	$(PDFLATEX) tmp_$<.tex;\
	mv tmp_$<.pdf $@;\
	rm -f tmp_$<*
	$(PDFCROP) --margin $(CROPMARG) $@ $@
	cp $@ $(OUTDIR)/

$(TIKZPREF)%.pdf: %.tikz $(DEPS)
	echo '\\documentclass[a4paper,12pt]{article}'        >  tmp_$<.tex;\
	echo '\\usepackage[cm,empty]{fullpage}'         >> tmp_$<.tex;\
	echo '\\usepackage{mathpazo,CrimsonPro}'        >> tmp_$<.tex;\
	echo '\\usepackage{tikz}'                       >> tmp_$<.tex;\
	echo '\\begin{document}'                        >> tmp_$<.tex;\
	echo '\\input{'"$<"'}'                          >> tmp_$<.tex;\
	echo '\\end{document}'                          >> tmp_$<.tex;\
	$(PDFLATEX) tmp_$<.tex;\
	mv tmp_$<.pdf $@;\
	rm -f tmp_$<*
	$(PDFCROP) --margin $(CROPMARG) $@ $@
	cp $@ $(OUTDIR)/

$(TBLPREF)%.pdf: %.table $(PSFIG) $(GPFIG) $(TIKZFIG) $(DEPS)
	echo '\\documentclass[a4paper,12pt]{article}'   >  tmp_$<.tex;\
	echo '\\usepackage[cm,empty]{fullpage}'    >> tmp_$<.tex;\
	echo '\\usepackage{mathpazo,CrimsonPro}'   >> tmp_$<.tex;\
	echo '\\usepackage{graphicx}'              >> tmp_$<.tex;\
	echo '\\begin{document}'                   >> tmp_$<.tex;\
	echo '\\input{'"$<"'}'                     >> tmp_$<.tex;\
	echo '\\end{document}'                     >> tmp_$<.tex;\
	$(PDFLATEX) tmp_$<.tex;\
	mv tmp_$<.pdf $@;\
	rm -f tmp_$<*
	$(PDFCROP) --margin $(CROPMARG) $@ $@
	cp $@ $(OUTDIR)/

%.ps: %.dvi $(DEPS)
	$(DVIPS) $<

.PHONY: clean veryclean

clean:
	rm -f *.log *.aux *.1 *.t1 

veryclean: clean
	rm -f $(AXOFIG) $(TIKZFIG) $(PSFIG) $(GPFIG) $(patsubst %.pdf,%.tex,$(GPFIG))	
