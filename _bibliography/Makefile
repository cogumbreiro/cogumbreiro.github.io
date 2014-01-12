# User provided
BST = $(shell pwd)/style.bst # Provide the full path
BIB = publications.bib

######################
# System configuration

# The target directory
TARGET = ../_includes

# The template with the publications
PUBS_HTML = $(TARGET)/publications.html
# The template with the HTML-ized bibtex
BIB_HTML = $(TARGET)/publications_bib.html
# The options for BIBTEX2HTML
BIBTEX2HTML = bibtex2html
BIBTEX2HTML_FLAGS = -nofooter -noheader -nokeywords -nokeys -nodoc 
all: build

build: $(PUB_HTML) $(BIB_HTML)

$(PUBS_HTML): $(BIB)
	$(BIBTEX2HTML) $(BIBTEX2HTML_FLAGS) -s $(BST) -o $(patsubst %.html,%,$@) $(BIB)
	./replace.py $@ $(BIB_HTML) "{{ include.url }}" # Make the link a parameter
	./replace.py $@ '<p><a name=' '<li class="bib" id=' # tag each element with a class
	./replace.py $@ '></a>' '>' # do not use an <a>nchor
	./replace.py $@ '</p>' '</li>' # tag each element with a class

$(BIB_HTML): $(PUBS_HTML)
	./replace.py $@ $(PUBS_HTML) "{{ include.url }}" # Make the link a parameter
	./replace.py $@ '<h1>'$(shell basename $(BIB))'</h1>' "" # Remove the header, because ugly
	./replace.py $@ '<a name=' '<div class="bib" id='
	./replace.py $@ '</pre>' '</pre></div>' # Remove the header, because ugly
	./replace.py $@ '</a><pre>' "<pre>" # HACK: Jekyll breaks silently without this

clean:
	rm -f $(BIB_HTML) $(PUBS_HTML)

