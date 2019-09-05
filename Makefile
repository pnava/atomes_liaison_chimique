input=main_ue13

default :
	 latex ${input}.tex
	 latex ${input}.tex
	 latex ${input}.tex
	 dvips ${input}.dvi -o
	 ps2pdf ${input}.ps ${input}.pdf
	 gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=main_ue13_annexe.pdf main_ue13.pdf PHYSICAL_CONSTANTS_NRL.pdf tab02.pdf tab03.pdf tab01.pdf
#	 gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=main_ue13_annexe.pdf main_ue13.pdf PHYSICAL_CONSTANTS_NRL.pdf annexeue13.pdf

correction :
	latex correction.tex
	dvipdf correction.dvi

booklet:
	latex ${input}.tex
	latex ${input}.tex
	latex ${input}.tex
	dvips -t a4 ${input}.dvi -o
	psbook < ${input}.ps > ${input}_.ps
	psnup -2  < ${input}_.ps > ${input}.ps
	ps2pdf ${input}.ps ${input}.pdf

