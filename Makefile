# Makefile
# 
# Converts Markdown to other formats (HTML, PDF, DOCX, RTF, ODT, EPUB) using Pandoc
# <http://johnmacfarlane.net/pandoc/>
#
# Run "make" (or "make all") to convert to all other formats
#
# Run "make clean" to delete converted files
#
# https://gist.github.com/kristopherjohnson/7466917

# Convert all files in this directory that have a .md suffix
SOURCE_DOCS := $(wildcard *.md)
PREFIX=cct-

EXPORTED_DOCS=\
 $(SOURCE_DOCS:.md=.pdf)
# $(SOURCE_DOCS:.md=.html) \ 
# $(SOURCE_DOCS:.md=.docx) \
# $(SOURCE_DOCS:.md=.rtf) \
# $(SOURCE_DOCS:.md=.odt) \
# $(SOURCE_DOCS:.md=.epub)

RM=/bin/rm

PANDOC=pandoc

PANDOC_OPTIONS=--smart --standalone

PANDOC_HTML_OPTIONS=--to html5
PANDOC_PDF_OPTIONS=--latex-engine=xelatex
PANDOC_DOCX_OPTIONS=
PANDOC_RTF_OPTIONS=
PANDOC_ODT_OPTIONS=
PANDOC_EPUB_OPTIONS=--to epub3


# Pattern-matching Rules

%.html : %.md
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_HTML_OPTIONS) -o ${PREFIX}$@ $<

%.pdf : %.md
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_PDF_OPTIONS) -o ${PREFIX}$@ $<
	
%.docx : %.md
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_DOCX_OPTIONS) -o ${PREFIX}$@ $<

%.rtf : %.md
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_RTF_OPTIONS) -o ${PREFIX}$@ $<

%.odt : %.md
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_ODT_OPTIONS) -o ${PREFIX}$@ $<

%.epub : %.md
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_EPUB_OPTIONS) -o ${PREFIX}$@ $<


# Targets and dependencies

.PHONY: all clean

all : $(EXPORTED_DOCS)

clean:
	- $(RM) $(EXPORTED_DOCS)
