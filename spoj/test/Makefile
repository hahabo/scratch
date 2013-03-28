all: test-c test-cc
test-c: test.c
	gcc -W -Wall -ansi -pedantic -g -O2 -o test-c test.c
test-cc: test.cc
	g++ -W -Wall -ansi -pedantic -g -O2 -o test-cc test.cc
clean:
	rm -rf test-c test-cc
