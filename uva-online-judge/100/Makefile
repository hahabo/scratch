all: 100-c 100-cc
100-cc: 100.cc
	g++ -W -Wall -g -ansi -pedantic -O2 -lm -lcrypt -pipe -DONLINE_JUDGE -o 100-cc 100.cc
100-c: 100.c
	gcc -W -Wall -g -ansi -pedantic -O2 -lm -lcrypt -pipe -DONLINE_JUDGE -o 100-c 100.c
clean:
	rm -rf 100-c 100-cc
