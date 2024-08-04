# User provided
BST = $(shell pwd)/style.bst # Provide the full path
BIB = publications.bib
# The template with the publications
PUBS_HTML = $(TARGET)/publications.html
BIB_HTML = $(TARGET)/publications_bib.html

######################
# System configuration

# The target directory
TARGET = ../_includes

all: build

build: $(PUB_HTML) $(BIB_HTML)

$(PUBS_HTML) $(BIB_HTML): $(BIB)
	./bib2html --bib-html $(BIB_HTML) -s $(BST) $(BIB) $(PUBS_HTML)

clean:
	rm -f $(BIB_HTML) $(PUBS_HTML)

.PHONY: all build clean
