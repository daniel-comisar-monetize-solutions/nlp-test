#!/usr/bin/env bash

# extract text
pdftotext test.pdf test11.txt

# delete lines with 0-2 words
awk 'NF>=3' test11.txt > test11-2.txt

# delete lines with less than 10 letters

# extract images
pdfimages test.pdf test11
