# User provided

LESS_DIR = .
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
MAIN_CSS = $(TARGET)/main.min.css
IE_CSS = $(TARGET)/ie.min.css

######################
# System configuration
TARGET = ../assets/css
LESSC = lessc

all: build

build: $(IE_CSS) $(MAIN_CSS)

$(IE_CSS): $(IE_LESS) $(LIB_LESS) 
	$(LESSC) $(IE_LESS) $(LESSCFLAGS) > $@

$(MAIN_CSS): $(MAIN_LESS) $(LIB_LESS)
	$(LESSC) $(MAIN_LESS) $(LESSCFLAGS) > $@

clean:
	rm -f $(IE_CSS) $(MAIN_CSS)

