#!/usr/bin/env perl
use strict;
use warnings;
use feature qw(say);

sub algo {
    my $n = shift;
    my @out;
    push @out, $n;
    while( $n != 1) {
	if ($n % 2) {
	    $n = 3*$n + 1;
	} else {
	    $n = $n/2;
	}
	push @out, $n;
    }
    return @out;
}

while (<STDIN>) {
    my ($i, $j) = split;
    my @cycle;
    my ($upper, $lower);
    if ($i > $j) {
	($upper, $lower) = ($i, $j);
    } else {
	($upper, $lower) = ($j, $i);
    }
    for (my $x = $lower; $x <= $upper; ++$x) {
	my @res = algo ($x);
	push @cycle, scalar @res;
	#say "$x -> @res";
	#say "\@cycle -> @cycle";
    }
    say "$i $j ", (sort {$a <=> $b} @cycle)[-1];
}
