#!/bin/bash

DSTDIR=pages

mkdir -p $DSTDIR
cd $DSTDIR

pdfseparate ../scans/EPSON_front.pdf page-front-%d.pdf
pdfseparate -f 1 -l 10 ../scans/EPSON_vii-26.pdf page-preface-%d.pdf

pdfseparate -f 11 ../scans/EPSON_vii-26.pdf %d
ls ?? | bb -o -i '(map #(format "mv %s page-1-%s.pdf" % (+ (clojure.edn/read-string %) -10)) *input*)' | sh

pdfseparate ../scans/EPSON_27-45.pdf %d
ls ? ?? | bb -o -i '(map #(format "mv %s page-2-%s.pdf" % (+ (clojure.edn/read-string %) 26)) *input*)' | sh

