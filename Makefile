.PHONY: help setup dependencies build clean

help:
	@cat $(firstword $(MAKEFILE_LIST))

setup: \
	dependencies \
	deps/coreutils/coreutils

dependencies:
	@type git > /dev/null

build: deps/coreutils/coreutils
	cd $< && \
		./bootstrap && \
		FORCE_UNSAFE_CONFIGURE=1 ./configure && \
		make && \
		make CFLAGS+=-Wno-error=logical-op

deps/coreutils/coreutils: deps
	git clone --recursive --depth 1 git@github.com:coreutils/coreutils.git $@

deps:
	mkdir -p $@

clean:
	rm -rf deps
