INKSCAPE ?= inkscape -d 384 -o

SLIM = $(wildcard *.slim)
SVG = $(SLIM:.slim=.svg)
PNG = $(SLIM:.slim=.png)

all: $(SVG) $(PNG)

%.png: %.svg
	$(INKSCAPE) $@ $<

%.svg: %.slim
	slimrb $< $@

clean:
	rm -f $(SVG) $(PNG)

.PHONY: all clean
