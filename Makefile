CC=oscar64
CFLAGS=-v
SRCDIR=src
OUTDIR=bin
OUTFILE=hilo.prg
OUTPUT=$(OUTDIR)/$(OUTFILE)
SOURCES=$(wildcard $(SRCDIR)/*.c)
INCLUDES=$(wildcard $(SRCDIR)/*.h)

.PHONY: all cleanbuild build clean run

all: clean build run

cleanbuild: clean build

build:
	$(CC) $(CFLAGS) -o=$(OUTPUT) $(SOURCES) $(INCLUDES)

debug_build:
	$(CC) $(CFLAGS) -g -o=$(OUTPUT) $(SOURCES) $(INCLUDES)

clean:
	rm -f $(OUTDIR)/*

run:
	# x64sc $(OUTDIR)/$(OUTFILE) &
	bash runBinary.sh $(OUTDIR)/$(OUTFILE)
