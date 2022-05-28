#!/usr/bin/env python3
from csv import reader
from sys import argv, stdin

for row in reader(stdin):
    with open(argv[1] + '/' + row.pop(0) + '.slim', 'w') as f:
        f.write('doctype xml\n')
        f.write('svg width="100%%" height="100%%" viewBox="0 0 %d %d"\n' % (len(row), len(row)))
        y = 0
        for color in row:
            f.write('  rect width="100%%" height="1" y="%d" fill="#%s"/\n' % (y, color))
            y += 1
