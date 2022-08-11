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
BIBTEX2HTML_FLAGS = -nofooter -noheader -nokeywords -nokeys -nodoc --named-field preprint preprint
all: build

build: $(PUB_HTML) $(BIB_HTML)

$(PUBS_HTML): $(BIB)
	$(BIBTEX2HTML) $(BIBTEX2HTML_FLAGS) -s $(BST) -o $(patsubst %.html,%,$@) $(BIB)
	# 1. Make the link a parameter
	# 2. tag each element with a class
	# 3. do not use an <a>nchor
	# 4. tag each element with a class
	./replace.py $@ \
		$(BIB_HTML) "{{ include.url }}" \
		'<p><a name=' '<li class="bib" id=' \
		'></a>' '>' \
		'</p>' '</li>'

$(BIB_HTML): $(PUBS_HTML)
	# 1. Make the link a parameter
	# 2. Remove the header, because ugly
	# 3. Remove the header, because ugly
	# 5. HACK: Jekyll breaks silently without this
	./replace.py \
		$@ $(PUBS_HTML) "{{ include.url }}" \
		'<h1>'$(shell basename $(BIB))'</h1>' "" \
		'<a name=' '<div class="bib" id=' \
		'</pre>' '</pre></div>' \
		'</a><pre>' "<pre>"

clean:
	rm -f $(BIB_HTML) $(PUBS_HTML)

