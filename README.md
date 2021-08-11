# Designs
Many designs and resources for those from chrissx Media.

## Scripting
i compiled xcftools
```sh
CFLAGS='-O3 -Wall -Wextra -I/opt/homebrew/include' LDFLAGS='-L/opt/homebrew/lib -lintl' ./configure --enable-precomputed-scaletable --prefix=$HOME/.local
make -j8 install
```
but it wont work with xcf11...
