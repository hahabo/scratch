all:		TEST-c TEST-cc

# C
TEST-c:		TEST.c
		gcc $(CFLAGS) TEST.c -o TEST-c

# C++
TEST-cc:	TEST.cc
		g++ $(CFLAGS) TEST.cc -o TEST-cc

# valgrind
val:		TEST-c TEST-cc TEST.in
		valgrind ./TEST-c < TEST.in
		valgrind ./TEST-cc < TEST.in

# run tests
try:		TEST-c TEST-cc TEST.pl
		perl try-TEST.pl

# clean 'em all
.PHONY:		clean
clean:
		rm -rf TEST-c TEST-cc TEST.in
