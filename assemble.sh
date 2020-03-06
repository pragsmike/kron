#!/bin/bash


cd pages

L=page-list.txt

ls -1 page-front-* | sort -t- -n -k 3 > $L
ls -1 page-preface-* | sort -t- -n -k 3 >> $L
ls -1 page-1-* | sort -t- -n -k 3 >> $L
ls -1 page-2-* | sort -t- -n -k 3 >> $L
ls -1 page-3-* | sort -t- -n -k 3 >> $L

pdfunite $(cat $L) diakoptics.pdf
