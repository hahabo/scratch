#!/usr/bin/env perl
use strict;
use warnings;

my $x;
while ($x = <STDIN>) {
    chomp $x;
    last if $x == 42;
    print "$x\n";
}
