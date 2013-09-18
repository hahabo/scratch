CFLAGS=-Wall -g

all:		INTEST-c INTEST-cc

# C
INTEST-c:	INTEST.c
		gcc $(CFLAGS) INTEST.c -o INTEST-c

# C++
INTEST-cc:	INTEST.cc
		g++ $(CFLAGS) INTEST.cc -o INTEST-cc

# valgrind
val:		INTEST-c INTEST-cc INTEST.in
		valgrind ./INTEST-c < INTEST.in
		valgrind ./INTEST-cc < INTEST.in

# run tests
try:		INTEST-c INTEST-cc INTEST.pl
		perl try-INTEST.pl

# clean 'em all
.PHONY:	clean
clean:
		rm -rf INTEST-c INTEST-cc INTEST.in
