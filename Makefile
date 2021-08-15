all: cm_style.png

cm_style.png: cm_style.svg
	inkscape cm_style.svg -o cm_style.png || inkscape cm_style.svg -e cm_style.png

cm_style.svg: make_cm_style.cl
	clisp make_cm_style.cl

.PHONY: all
