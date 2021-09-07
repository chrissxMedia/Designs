CL ?= sbcl --script
INKSCAPE ?= inkscape -o

all: cm_style.png cm_style.svg

%.png: %.svg
	$(INKSCAPE) $@ $<

%.svg: %.cl svg.cl
	$(CL) $<

clean:
	rm -f cm_style.png cm_style.svg

.PHONY: all clean
