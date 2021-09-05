CLISP ?= clisp
INKSCAPE ?= inkscape -o

all: cm_style.png

cm_style.png: cm_style.svg
	$(INKSCAPE) cm_style.png cm_style.svg

cm_style.svg: make_cm_style.cl
	$(CLISP) make_cm_style.cl

clean:
	rm -f cm_style.png cm_style.svg

.PHONY: all clean
