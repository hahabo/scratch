CFLAGS=-Wall -g

all:		HS08TEST-c HS08TEST-cc

# C
HS08TEST-c:	HS08TEST.c
		gcc $(CFLAGS) HS08TEST.c -o HS08TEST-c

# C++
HS08TEST-cc:	HS08TEST.cc
		g++ $(CFLAGS) HS08TEST.cc -o HS08TEST-cc

# valgrind
val:		HS08TEST-c HS08TEST-cc HS08TEST.in
		valgrind ./HS08TEST-c < HS08TEST.in
		valgrind ./HS08TEST-cc < HS08TEST.in

# run tests
try:		HS08TEST-c HS08TEST-cc HS08TEST.pl
		perl try-HS08TEST.pl

# clean 'em all
.PHONY:	clean
clean:
		rm -rf HS08TEST-c HS08TEST-cc HS08TEST.in
