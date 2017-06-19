#!/usr/bin/make -f
## makefile
## Mac Radigan

.PHONY: build
.DEFAULT_GOAL := build

build:
	gcc \
	  -shared \
	  -I. \
	  -I/usr/src/linux-headers-4.8.0-54/include \
	  -I/usr/src/linux-headers-4.8.0-54/arch/x86/include \
	  inode.c \
	  file-mmu.c \
	  file-nommu.c \
	  -o ramfs.ko

## *EOF*
