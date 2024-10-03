SHELL=/bin/bash

LATEX := ./bin/latexrun --color auto -W no-overfull -W no-citation
PAPER := paper

.PHONY: all clean

all: $(PAPER).pdf

.PHONY: FORCE
$(PAPER).pdf: FORCE
	# @rm -f $@
	$(LATEX) $(addsuffix .tex, $(basename $@)) -O .latex.out -o $@

arxiv: arxiv.tar.gz

arxiv.tar.gz: $(PAPER).pdf
	rm -rf arxiv
	mkdir -p arxiv
	latexpand --empty-comments $(PAPER).tex > arxiv/paper.tex
	cp .latex.out/paper.bbl arxiv/
	cp paper.cls macros.tex usenix-2020-09.sty arxiv/
	mkdir -p arxiv/figures arxiv/graphs
	cp figures/*.pdf arxiv/figures/
	cp graphs/*.pdf arxiv/graphs/
	(cd arxiv && tar czf ../arxiv.tar.gz *)

clean:
	$(LATEX) --clean-all -O .latex.out
	rm -frv .latex.out $(PAPER).pdf

watch:
	while true; do \
	    $(MAKE); \
	    inotifywait -qre close_write .; \
	done