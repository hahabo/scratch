#!/usr/bin/env perl
use strict;
use warnings;
use feature qw(say);

my $debug = 1;

my $time = '';
$time = '/usr/bin/time -p' if $debug;

for (1..1) {
    qx(rm -rf /tmp/$0.in);
    say "case#$_:";
    my $max = 5;
    qx(echo $max >> /tmp/$0.in);
    for (1..$max) {
	my $i = int(rand(1_0_000_000));
	++$i if $i == 0;
	my $j = int(rand(1_0_000_000));
	++$j if $j == 0;
	($i, $j) = ($j, $i) if $i > $j;
	qx(echo $i $j >> /tmp/$0.in);
    }
    say "in:";
    say qx(cat /tmp/$0.in);
    # say "out:perl:";
    # say qx(perl prime1.pl < /tmp/$0.in);
    say "out:c:";
    print qx($time ./prime1-c < /tmp/$0.in 2>&1);
    say "out:cc:";
    print qx($time ./prime1-cc < /tmp/$0.in 2>&1);
}
