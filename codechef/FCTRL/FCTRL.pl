#!/usr/bin/env perl
use strict;
use warnings;
#use Math::BigInt;

chomp(my $t = <STDIN>);

while (my $n = <STDIN>) {
    chomp $n;
    print z($n), "\n";
}

sub z {
    my ($n) = @_;
    my $z = int($n/5);
    my $x = $z;
    while ($x > 0) {
	$x = int($x / 5);
	$z += $x;
    }
    $z
}

sub t {
    for (1 .. 2_000) {
	my $x = Math::BigInt->new($_);
	my $y = $x->bfac;
	$y =~ m/(0+)$/g;
	my $z = split //,$1;
	print "z($_) = $z $_/5 = ", $_/5, " z($_) = ", z($_), "\n";
    }
}
