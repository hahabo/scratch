#!/usr/bin/env perl
use strict;
use warnings;

while(my $x = <STDIN>) {
    chomp $x;
    last if $x == 42;
    print "$x\n";
}
