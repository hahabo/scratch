#!/usr/bin/env perl
use strict;
use warnings;
use feature qw(say);

for (1..10) {
    qx(rm -rf /tmp/$0.in);
    say "case#$_:";
    for (1..10) {
	my $i = int(rand(1_000_00));
	++$i if $i == 0;
	my $j = int(rand(1_000_00));
	++$j if $j == 0;
	qx(echo $i $j >> /tmp/$0.in);
    }
    say "in:";
    say qx(cat /tmp/$0.in);
    say "out:perl:";
    say qx(perl 100.pl < /tmp/$0.in);
    say "out:c:";
    say qx(./100-c < /tmp/$0.in);
    say "out:cc:";
    say qx(./100-cc < /tmp/$0.in);
}
