CFLAGS=-Wall -g

all:		[SCRATCH]-c [SCRATCH]-cc

# C
[SCRATCH]-c:	[SCRATCH].c
		gcc $(CFLAGS) [SCRATCH].c -o [SCRATCH]-c

# C++
[SCRATCH]-cc:	[SCRATCH].cc
		g++ $(CFLAGS) [SCRATCH].cc -o [SCRATCH]-cc

# valgrind
val:		[SCRATCH]-c [SCRATCH]-cc [SCRATCH].in
		valgrind ./[SCRATCH]-c < [SCRATCH].in
		valgrind ./[SCRATCH]-cc < [SCRATCH].in

# run tests
try:		[SCRATCH]-c [SCRATCH]-cc [SCRATCH].pl
		perl try-[SCRATCH].pl

# clean 'em all
.PHONY:	clean
clean:
		rm -rf [SCRATCH]-c [SCRATCH]-cc [SCRATCH].in
