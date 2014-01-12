all: build

build:
	make -C _js
	make -C _less
	make -C _bibliography

clean:
	make -C _js clean
	make -C _less clean
	make -C _bibliography clean

