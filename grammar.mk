
all: src/gram.c

src/%.y: inst/grammar/%.y
	cp $< $@

src/%.c: src/%.y
	cd src; bison -v gram.y -o gram.c
	-mv src/gram.output inst/grammar

inst/grammar/gram.output: src/gram.c
inst/grammar/%.output: src/%.output
	mv $< $@
	
data/grammar_symbols.rda: inst/grammar/grammar_symbols.R inst/grammar/gram.output
	Rscript $^ $@

.PHONY: clean
clean:
	-mv src/gram.output inst/grammar
	-rm -f src/gram.y

