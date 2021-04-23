# Sample makefile for Moinho application on Unix.
# This example assumes Linux with gcc.

# This makefile is in the public domain
# jml, ISEP.IPP.PT, 2003

CC = gcc

CFLAGS = -g  -O3 -Wall

INCDIRS = -I. -I../include

LIBDIRS = -L/usr/lib64

LIBS = -lglut -lGLU -lGL -lm $(SOIL_LIB)

OLD_LIBS = -Xmu -lX11 -lXext -lXt -lXi -lSM -lICE
ALT_LIBS = -lglfw
SOIL_LIB = -lSOIL

DISTDIR = http://ave.dee.isep.ipp.pt/~jml/intmu/lab5

OBJECTS = $(PROGRAM).o 

SRC = $(PROGRAM).c
	
PROGRAM = moinho

IMAGE1 = roof_tiles.png 
IMAGE2 = bricks.png
IMAGE3 = grass.jpg

default: $(PROGRAM)

$(OBJECTS): $(SRC)

$(PROGRAM): $(OBJECTS)
	$(CC) $^ $(LIBDIRS) $(LIBS) -o $@

clean:
	rm -f *.o $(PROGRAM)

depend:
	makedepend -- $(CFLAGS) -- $(SRC)

getall:
	wget -q ${DISTDIR}/${SRC} ${DISTDIR}/${IMAGE1}  ${DISTDIR}/${IMAGE2} ${DISTDIR}/${IMAGE3}

instSOIL:
	su -c "dnf -y install SOIL SOIL-devel"

inst_reqs:
	su -c "dnf -y install SOIL SOIL-devel freeglut freeglut-devel"

submit: $(PROGRAM) $(SRC)
	@echo "Submeta os ficheiros '$^' no Moodle"

old_submit: $(PROGRAM) $(SRC)
	@mkdir -p .submit_tmp/WWW/intmu/lab5
	cp -a $^ .submit_tmp/WWW/intmu/lab5/
	@echo "Connecting to ave.dee.isep.ipp.pt"
	read -p "Login: " nr ;\
	scp -r -p .submit_tmp/* "$$nr"@ave.dee.isep.ipp.pt:
	##@rm -rf .submit_tmp/

