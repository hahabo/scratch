#!/usr/bin/env perl
use strict;
use warnings;

chomp(my $line = <STDIN>);

my ($n, $k) = split /\s+/, $line;

my $count = 0;

while (my $t = <STDIN>) {
    $count++ unless $t % $k;
}

print "$count\n";
