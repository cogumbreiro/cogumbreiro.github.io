DEST = _site/
BST = $(PWD)/_bibliography/style.bst
OUT_HTML = $(PWD)/_includes/publications.html
OUT_BIB_HTML = $(PWD)/_includes/publications_bib.html
BIB = $(PWD)/_bibliography/publications.bib
TPL_DIR = _template
LESS_DIR = $(TPL_DIR)/less
LIB_LESS = \
	$(LESS_DIR)/1382.less \
	$(LESS_DIR)/icomoon.less \
	$(LESS_DIR)/2x.less \
	$(LESS_DIR)/ie.less \
	$(LESS_DIR)/480.less \
	$(LESS_DIR)/magnific-popup.less \
	$(LESS_DIR)/600.less \
	$(LESS_DIR)/main.less \
	$(LESS_DIR)/768.less \
	$(LESS_DIR)/mixins.less \
	$(LESS_DIR)/992.less \
	$(LESS_DIR)/normalize.less \
	$(LESS_DIR)/bib.less \
	$(LESS_DIR)/page.less \
	$(LESS_DIR)/coderay.less \
	$(LESS_DIR)/print.less \
	$(LESS_DIR)/elements.less \
	$(LESS_DIR)/pygments.less \
	$(LESS_DIR)/fade.less \
	$(LESS_DIR)/site.less \
	$(LESS_DIR)/forms.less \
	$(LESS_DIR)/typography.less \
	$(LESS_DIR)/gnome-palette.less \
	$(LESS_DIR)/variables.less \
	$(LESS_DIR)/grid.less

MAIN_LESS = $(LESS_DIR)/main.less
IE_LESS = $(LESS_DIR)/ie.less
MAIN_CSS = assets/css/main.min.css
IE_CSS = assets/css/ie.min.css

JS_DIR = $(TPL_DIR)/js
MAIN_JS = $(JS_DIR)/main.js
JS_SRC = \
	$(JS_DIR)/main.js \
	$(JS_DIR)/plugins/jquery.fitvids.js \
	$(JS_DIR)/plugins/jquery.magnific-popup.js

OUT_JS = assets/js/scripts.min.js

JSC = uglifyjs

LESSC = lessc

BIBOPTS = -nofooter -noheader -nokeywords -nokeys -nodoc 


all: build

build: $(OUT_HTML) $(IE_CSS) $(MAIN_CSS)

$(IE_CSS): $(IE_LESS) $(LIB_LESS) $(OUT_JS)
	$(LESSC) $(IE_LESS) $(LESSCFLAGS) > $@

$(MAIN_CSS): $(MAIN_LESS) $(LIB_LESS)
	$(LESSC) $(MAIN_LESS) $(LESSCFLAGS) > $@

$(OUT_JS): $(JS_SRC)
	$(JSC) $(JS_SRC) > $@

$(OUT_HTML): $(BIB)
	bibtex2html $(BIBOPTS) -s $(BST) -o $(patsubst %.html,%,$@) $(BIB)
	./replace.py $@ $(patsubst %.html,%_bib.html,$@) "{{ include.url }}" # Make the link a parameter
	./replace.py $@ '<p><a name=' '<li class="bib" id=' # tag each element with a class
	./replace.py $@ '></a>' '>' # do not use an <a>nchor
	./replace.py $@ '</p>' '</li>' # tag each element with a class
	./replace.py $(patsubst %.html,%_bib.html,$@) $@ "{{ include.url }}" # Make the link a parameter
	./replace.py $(patsubst %.html,%_bib.html,$@) '<h1>'$(shell basename $(BIB))'</h1>' "" # Remove the header, because ugly
	./replace.py $(patsubst %.html,%_bib.html,$@) '<a name=' '<div class="bib" id='
	./replace.py $(patsubst %.html,%_bib.html,$@) '</pre>' '</pre></div>' # Remove the header, because ugly
	./replace.py $(patsubst %.html,%_bib.html,$@) '</a><pre>' "<pre>" # HACK: Jekyll breaks silently without this

clean:
	rm -f $(OUT_HTML) $(OUT_BIB_HTML) $(IE_CSS) $(MAIN_CSS)

