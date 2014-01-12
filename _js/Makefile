
JS_DIR = .
MAIN_JS = $(JS_DIR)/main.js
LIB_JS = \
	$(JS_DIR)/plugins/jquery.fitvids.js \
	$(JS_DIR)/plugins/jquery.magnific-popup.js

TARGET_DIR = ../assets/js
SCRIPTS_JS = $(TARGET_DIR)/scripts.min.js

UGLIFYJS = uglifyjs

all: build

build: $(SCRIPTS_JS)

ifeq ($(shell which $(UGLIFYJS)),)
$(SCRIPTS_JS): $(MAIN_JS) $(LIB_JS)
	cat $^ > $@
else
$(SCRIPTS_JS): $(MAIN_JS) $(LIB_JS)
	$(UGLIFYJS) $< > $@
endif

clean:
	rm -f $(SCRIPTS_JS) 

