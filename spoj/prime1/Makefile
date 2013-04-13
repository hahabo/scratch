all: prime1-c prime1-cc
prime1-c: prime1.c
	gcc -W -Wall -ansi -pedantic -g -O2 -o prime1-c prime1.c -lm
prime1-cc: prime1.cc
	g++ -W -Wall -ansi -pedantic -g -O2 -o prime1-cc prime1.cc -lm
clean:
	rm -rf prime1-c prime1-cc
