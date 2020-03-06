#!/bin/bash

DSTDIR=pages

mkdir -p $DSTDIR
cd $DSTDIR

SRCDIR=../scans

pdfseparate $SRCDIR/EPSON_front.pdf %d
for i in ?; do
    pdfimages $i -j d &&
        convert d-000.jpg -quality 8 $i.pdf &&
        mv $i.pdf $i
done
ls ? | bb -o -i '(map #(format "mv %s page-front-%s.pdf" % (+ (clojure.edn/read-string %) 0)) *input*)' | sh



pdfseparate -f 1 -l 10 $SRCDIR/EPSON_vii-26.pdf %d
for i in ? ??; do
    pdfimages $i -j d &&
        convert d-000.jpg -quality 8 $i.pdf &&
        mv $i.pdf $i
done
ls ? ?? | bb -o -i '(map #(format "mv %s page-preface-%s.pdf" % (+ (clojure.edn/read-string %) 0)) *input*)' | sh



pdfseparate -f 11 $SRCDIR/EPSON_vii-26.pdf %d
for i in ??; do
    pdfimages $i -j d &&
    convert d-000.jpg -quality 8 $i.pdf &&
    mv $i.pdf $i
done
ls ?? | bb -o -i '(map #(format "mv %s page-1-%s.pdf" % (+ (clojure.edn/read-string %) -10)) *input*)' | sh

pdfseparate $SRCDIR/EPSON_27-45.pdf %d
for i in ? ??; do
    pdfimages $i -j d &&
    convert d-000.jpg -quality 8 $i.pdf &&
    mv $i.pdf $i
done
ls ? ?? | bb -o -i '(map #(format "mv %s page-2-%s.pdf" % (+ (clojure.edn/read-string %) 26)) *input*)' | sh


pdfseparate $SRCDIR/EPSON_46-101.pdf %d
for i in ? ??; do
    pdfimages $i -j d &&
        convert d-000.jpg -quality 8 $i.pdf &&
        mv $i.pdf $i
done
ls ? ?? | bb -o -i '(map #(format "mv %s page-3-%s.pdf" % (+ (clojure.edn/read-string %) 45)) *input*)' | sh


pdfseparate $SRCDIR/EPSON_102-134.pdf %d
for i in ? ??; do
    pdfimages $i -j d &&
        convert d-000.jpg -quality 8 $i.pdf &&
        mv $i.pdf $i
done
ls ? ?? | bb -o -i '(map #(format "mv %s page-4-%s.pdf" % (+ (clojure.edn/read-string %) 45)) *input*)' | sh


pdfseparate $SRCDIR/EPSON_135-166.pdf %d
for i in ? ??; do
    pdfimages $i -j d &&
    convert d-000.jpg -quality 8 $i.pdf &&
    mv $i.pdf $i
done
ls ? ?? | bb -o -i '(map #(format "mv %s page-5-%s.pdf" % (+ (clojure.edn/read-string %) 45)) *input*)' | sh

rm -f d-000.jpg
