CL ?= sbcl --script
INKSCAPE ?= inkscape -o

all: cm_style.png cm_style.svg btw_i_use_amplos.svg btw_i_use_amplos.png

%.png: %.svg
	$(INKSCAPE) $@ $<

%.svg: %.cl svg.cl
	$(CL) $<

clean:
	rm -f cm_style.png cm_style.svg

.PHONY: all clean
