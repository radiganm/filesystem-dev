#!/usr/bin/make -f
## makefile
## Mac Radigan

.PHONY: bootstrap update packages-apt install build clean build-ramfs build-simplefs build-aufs
.DEFAULT_GOAL := build

build: build-ramfs build-simplefs build-aufs

clean:
	#$(MAKE) -C linux-kernel-4.11.6/fs/ramfs $@
	$(MAKE) -C simplefs $@
	$(MAKE) -C aufs/kern $@
	$(MAKE) -C aufs/user $@

build-ramfs:
	$(MAKE) -C linux-kernel-4.11.6/fs/ramfs -f bootstrap.mk

build-simplefs:
	$(MAKE) -C simplefs

build-aufs:
	$(MAKE) -C aufs/kern
	$(MAKE) -C aufs/user

bootstrap: update packages-apt

install:

update:
	git submodule init && git submodule update --recursive --remote

packages-apt:
	sudo apt-get install -y gcc
	sudo apt-get install -y build-essential
	## NB.  enable source URIs in sources.list
	sudo apt-get source linux-source

## *EOF*
