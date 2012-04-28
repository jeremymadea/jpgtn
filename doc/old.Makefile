
#
# Installation directories -- Change these to the directories where you want 
#                             the binary and man pages to be installed.
#
prefix = /home/jeremy

BINDIR = $(prefix)/bin
MANDIR = $(prefix)/man/man1

#
# Compiler -- Set this to your C compiler
#
CC = gcc

#
# Compiler flags -- You may have to modify the -L and -I flags to point to the
#                   directories where your libjpeg library and includes can be 
#                   found.
#                   CFLAGS = -Wall -O2 -L/usr/local/lib -I/usr/local/include
#CFLAGS = -Wall -O2 
CFLAGS = -Wall -O2 -L/home/jeremy/lib -I/home/jeremy/include


#
# Libraries
#
LIB = -ljpeg


#
# Utility variables.
#

SRC = jpgtn.c readjpeg.c resizepic.c writejpeg.c
OBJ = jpgtn.o readjpeg.o resizepic.o writejpeg.o

#
# Rules
#
all: jpgtn

jpgtn: $(OBJ)
	$(CC) $(CFLAGS) -o jpgtn $(OBJ) $(LIB)

install:
	install -c -m 755 jpgtn $(BINDIR)
	install -c -m 644 jpgtn.1 $(MANDIR)

clean:
	rm -f *.o core jpgtn

#
# Dependencies
#
jpgtn.o : jpgtn.c jpgtn.h
readjpeg.o : readjpeg.c jpgtn.h
resizepic.o : resizepic.c jpgtn.h
writejpeg.o : writejpeg.c jpgtn.h
