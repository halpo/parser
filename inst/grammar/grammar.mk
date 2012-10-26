
all: ../../src/gram.c

../../src/%.y: %.y
	cp $< $@

../../src/%.c: ../../src/%.y
	cd src; bison -v gram.y -o gram.c
	-mv src/gram.output inst/grammar

gram.output: ../../src/gram.c
inst/grammar/%.output: src/%.output
	mv $< $@
	
symbols: ../data/grammar_symbols.rda
../data/grammar_symbols.rda: grammar_symbols.R gram.output
	Rscript $^ $@

.PHONY: clean symbols
clean:
	-mv ../../src/gram.output ../../inst/grammar
	-rm -f ../../src/gram.y

