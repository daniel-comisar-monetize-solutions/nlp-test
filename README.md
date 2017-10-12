    pdftotext test.pdf test1.txt

Extracts sentences plus lots of garbage (from image overlays, i.e. text
labels on vehicle images). Images are lost.

---

    pdftotext -layout test.pdf  test2.txt

Does preserve layout, but multiple columns make it harder to parse. Images
are lost.

---

    pdftohtml test.pdf test3.html

Splits into multiple files and adds table of contents, which is annoying.
The layout is promising: paragraphs and images can be found inside the same
tags.  However, many garbage tags are present (again due to image overlays).
Also lots of &#160; type characters which can be filtered out.

---

    pdftohtml -xml test.pdf test4.xml

Also has potential. Paragraphs and images are found inside the same tag.
Each sentence is inside its own <text> tag, but these can be joined
together. Still garbage data present (e.g. 16 15 14 13 ...).

---

    pdf2svg test.pdf test5.svg

This was suggested as a better form of xml conversion, but I wasn't
impressed.

---

    pdfimages test.pdf test6

The images were extracted as expected, but many labels are missing that were
present as overlays. Also there's no indication of where in the pdf they
were from.

---

    pdftoxml test.pdf test7.xml

Like pdftohtml -xml, but this version splits every word into its own <text>
tag. I don't recommend it.

---

    pdfminer ...

We could look into this for detailed text parsing, but it doesn't handle
images (or only jpegs) so I'll skip it for now.

---

    gs -dBATCH -dNOPAUSE -sDEVICE=txtwrite -dFirstPage=1 -dLastPage=3 \
    -sOutputFile=test8.txt test.pdf

Another version of "pdftotext -layout" using Ghostscript. Rendering the
images as text makes it difficult to work with.

---

    docsplit text test.pdf

Another version of pdftotext.

---

    docsplit images test.pdf

Another version of pdfimages.

---

    pdf2htmlEX test.pdf test10.html

Splits each letter into its own tag, not ideal.
