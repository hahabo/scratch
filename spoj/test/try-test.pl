#!/usr/bin/env perl
use strict;
use warnings;
use feature qw(say);

for (1..10) {
    qx(rm -rf /tmp/$0.in);
    say "case#$_:";
    for (1..10) {
	my $i = int(rand(1_00));
	qx(echo $i >> /tmp/$0.in);
    }
    say "in:";
    say qx(cat /tmp/$0.in);
    say "out:perl:";
    say qx(perl test.pl < /tmp/$0.in);
    say "out:c:";
    say qx(./test-c < /tmp/$0.in);
    say "out:cc:";
    say qx(./test-cc < /tmp/$0.in);
}
