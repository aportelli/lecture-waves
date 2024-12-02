MKPLOT = mkplot/mkplot

GPPREF = gp_
TIKZPREF = tikz_

DEPS     = Makefile $(MKPLOT) $(wildcard *.dat)
OUTDIR   = ..
TIKZFIG  = $(patsubst %.tikz,$(TIKZPREF)%.pdf,$(wildcard *.tikz))
GPFIG    = $(patsubst %.plt,$(GPPREF)%.pdf,$(wildcard *.plt))

all: $(TIKZFIG) $(GPFIG)
	
$(GPPREF)%.pdf: %.plt common.gp $(DEPS)
	$(MKPLOT) gnuplot $< $@
	cp $@ $(OUTDIR)/

$(TIKZPREF)%.pdf: %.tikz $(DEPS)
	$(MKPLOT) tikz $< $@
	cp $@ $(OUTDIR)/

.PHONY: clean veryclean

clean:
	rm -f *.log *.aux *.1 *.t1 

veryclean: clean
	rm -f $(TIKZFIG) $(GPFIG)
