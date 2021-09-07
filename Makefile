CLISP ?= clisp
INKSCAPE ?= inkscape -o

all: cm_style.png

%.png: %.svg
	$(INKSCAPE) $@ $<

%.svg: %.cl svg.cl
	$(CLISP) $<

clean:
	rm -f cm_style.png cm_style.svg

.PHONY: all clean
