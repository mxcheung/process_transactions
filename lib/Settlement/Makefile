#
# all: 
# 	perltidy on all .pl, .pm, .t
# 	perlcritic on all .pl, .pm, .t
# 	make pod PDFs from .pm
#
# clean:
#	rm *.bak
#

PL = $(wildcard *.pl)
PM = $(wildcard *.pm)
T = $(wildcard *.t)

PDFS = $(PM:%.pm=%.pdf)

all: perltidy perlcritic $(PDFS)

perltidy: $(PL) $(PM) $(T)
	perltidy -b $(PL) $(PM) $(T)

perlcritic: $(PL) $(PM) $(T)
	perlcritic --harsh $(PL) $(PM) $(T)

%.pdf: %.pm
	pod2pdf $^ > $@ 
    
clean:
	rm -f *.bak
