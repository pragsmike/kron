diakoptics.pdf: scans
	rm -f pages/* && ./xpage.sh && ./assemble.sh && mv pages/diakoptics.pdf .
