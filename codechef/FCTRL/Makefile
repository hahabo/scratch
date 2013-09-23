CFLAGS=-Wall -g

all:		FCTRL-c FCTRL-cc

# C
FCTRL-c:	FCTRL.c
		gcc $(CFLAGS) FCTRL.c -o FCTRL-c

# C++
FCTRL-cc:	FCTRL.cc
		g++ $(CFLAGS) FCTRL.cc -o FCTRL-cc

# valgrind
val:		FCTRL-c FCTRL-cc FCTRL.in
		valgrind ./FCTRL-c < FCTRL.in
		valgrind ./FCTRL-cc < FCTRL.in

# run tests
try:		FCTRL-c FCTRL-cc FCTRL.pl
		perl try-FCTRL.pl

# clean 'em all
.PHONY:	clean
clean:
		rm -rf FCTRL-c FCTRL-cc FCTRL.in
