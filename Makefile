USER = cogumbreiro
SERVER = lasige-serv
REMOTE_DIR = /home/cogumbreiro/public_html

all: build

build:
	jekyll build

publish: build
	rsync -arzv _site/ $(USER)@$(SERVER):$(REMOTE_DIR)

clean:
	rm -f $(DST)/index.html
	rm -f $(TMP)/publications.html

serve:
	jekyll serve --watch
