# Designs
Many designs from chrissx Media and resources for those.

## Dependencies
For rebuilding all of the logos you need the following software packages:
- `make`
- `clisp` (or another Common Lisp implementation)
- `inkscape` (pre-1.0 versions need custom hacks)
- `gimp`
Additionally you need the following fonts:
- `Unifont`
- `Minecraft`

## A Note on GIMP Scripting
Scripting GIMP is horribly broken (at least on macOS), but thankfully you can use `xcftools`:
```sh
CFLAGS=-I/opt/homebrew/include LDFLAGS="-L/opt/homebrew/lib -lintl" ./configure --prefix=$HOME/.local
make -j8 install
```
But they don't support xcf11…

So you will have to export from GIMP yourself.

## Building
Remove the old build files and run `make`.
Then open up all the GIMP files and export them.

Running `make` might require custom configuration, like with `inkscape` < 1.0:
`INKSCAPE="inkscape -e" make`

or with other Common Lisp runtimes:

`CLISP="sbcl --script" make`
