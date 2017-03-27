all: build

build:
	make -C _js
#	make -C _less
	make -C _bibliography

clean:
	make -C _js clean
	make -C _less clean
	make -C _bibliography clean
	rm -rf hj-coq

### PLACES'16 ###

PLACES16:= \
  src/Phasers/Regmode.v\
  src/Phasers/Taskview.v\
  src/Phasers/Phaser.v\
  src/Phasers/Phasermap.v\
  src/Phasers/Lang.v\
  src/Phasers/Welformedness.v\
  src/Phasers/PhaseOrdering/Taskview.v\
  src/Phasers/PhaseOrdering/Phaser.v\
  src/Common.v\
  src/Vars.v

PLACES16_DIR = places16/coqdoc

do-places16: hj-coq/Makefile
	$(MAKE) -C hj-coq VFILES="$(PLACES16)"
	rm -rf hj-coq/html
	$(MAKE) -C hj-coq COQDOCFLAGS="--interpolate --title 'HJ Formalization in Coq' -l --lib-subtitles" VFILES="$(PLACES16)" html
	rsync -av hj-coq/html/ $(PLACES16_DIR)

hj-coq/Makefile: hj-coq
	(cd hj-coq && ./configure.sh)

hj-coq:
	git clone https://github.com/cogumbreiro/hj-coq


sync: hj-coq
	(cd hj-coq; git pull)

##########
