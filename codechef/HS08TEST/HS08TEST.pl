#!/usr/bin/env perl
use strict;
use warnings;

chomp(my $line = <STDIN>);

my ($x, $y) = (split /\s+/, $line);
my $bank_charge = 0.5;
#print "$x $y\n";

if ($x % 5) {
    print "$y\n";
    exit 0;
}

if ($x + $bank_charge <= $y) {
    printf "%.2f\n", $y - ($x + $bank_charge);
} else {
    print "$y\n";
}
