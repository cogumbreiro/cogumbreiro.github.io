USER = cogumbreiro
SERVER = lasige-serv
REMOTE_DIR = /home/cogumbreiro/public_html
DEST = _site/
BST = $(PWD)/_bibliography/style.bst
OUT_HTML = $(PWD)/_includes/publications.html
OUT_BIB_HTML = $(PWD)/_includes/publications_bib.html
BIB = $(PWD)/_bibliography/publications.bib
URL = 

BIBOPTS = -nofooter -noheader -nokeywords -nokeys -nodoc 


all: build

build: $(OUT_HTML)
	jekyll build -d $(DEST)

$(OUT_HTML): $(BIB)
	bibtex2html $(BIBOPTS) -s $(BST) -o $(patsubst %.html,%,$@) $(BIB)
	./replace.py $@ $(patsubst %.html,%_bib.html,$@) "{{ include.url }}" # Make the link a parameter
	./replace.py $@ '<p><a name' '<li class="bib"><a id' # tag each element with a class
	./replace.py $@ '</p>' '</li>' # tag each element with a class
	./replace.py $(patsubst %.html,%_bib.html,$@) $@ "{{ include.url }}" # Make the link a parameter
	./replace.py $(patsubst %.html,%_bib.html,$@) '<h1>'$(shell basename $(BIB))'</h1>' "" # Remove the header, because ugly
	./replace.py $(patsubst %.html,%_bib.html,$@) '<a name=' '<div class="bib"><a name='
	./replace.py $(patsubst %.html,%_bib.html,$@) '</pre>' '</pre></div>' # Remove the header, because ugly
	./replace.py $(patsubst %.html,%_bib.html,$@) '</a><pre>' "</a>\n<pre>" # HACK: Jekyll breaks silently without this

publish: build
	rsync -arzv _site/ $(USER)@$(SERVER):$(REMOTE_DIR)

clean:
	rm -rf $(DEST)

serve:
	jekyll serve --watch
