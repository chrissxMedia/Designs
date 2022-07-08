#!/usr/bin/env python3
import csv
from sys import argv, stdin

with open(argv[1] + '/' + 'all.slim', 'w', encoding='utf-8') as a:
    a.write('doctype xml\n')
    a.write('svg width="210mm" height="297mm" viewBox="0 0 210mm 297mm"\n')
    i = 0
    for row in csv.reader(stdin):
        with open(argv[1] + '/' + row.pop(0) + '.slim', 'w', encoding='utf-8') as f:
            f.write('doctype xml\n')
            f.write(f'svg width="100%" height="100%" viewBox="0 0 {len(row)} {len(row)}"\n')
            x = 42 if i < 6 else 126
            basey = (i % 6) * (4 + 42) + 8.5
            y = 0
            for color in row:
                f.write(f'  rect width="100%" height="1" y="{y}" fill="#{color}"/\n')
                # 42 was chosen for a reason left as an exercise to the reader
                a.write(f'  rect width="42mm" height="{42 / len(row)}mm" x="{x}mm" y="{basey + y * 42 / len(row)}mm" fill="#{color}"/\n')
                y += 1
            i += 1
