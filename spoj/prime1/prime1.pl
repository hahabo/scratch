#!/usr/bin/env perl
use strict;
use warnings;
use Data::Dumper;

my $debug = 0;
my $max = 10**4;
my %prime_cache;
my @prime_cache;

sub is_prime {
    my $x = shift;
    return 0 if $x < 2;
    return 1 if $x == 2;
    my $bound = sqrt ($x);
    for (my $i = 3; $i <= $bound; $i+=2) {
	return 0 unless $x % $i;
    }
    return 1;
}

sub is_prime_cache {
    my $x = shift;
    return $prime_cache{$x} if $x <= $max;
    my $bound = sqrt $x;
    for (my $i = 0; $i < @prime_cache && $prime_cache[$i] <= $bound; ++$i) {
	return 0 unless $x % $prime_cache[$i];
    }
    return 1;
}

sub fill_prime_cache {
    $prime_cache{2} = 1;
    for (my $i = 3; $i <= $max; $i+=2) {
	$prime_cache{$i} = 1 if is_prime $i;
    }
    @prime_cache = sort {$a <=> $b} keys %prime_cache;
}

fill_prime_cache;
print Dumper \%prime_cache if $debug;
print Dumper \@prime_cache if $debug;

chomp (my $total_case = <STDIN>);

while (<STDIN>) {
    chomp;
    my ($m, $n) = split;
    print "$m $n\n" if $debug;
    $m = 2 if $m < 2;
    print "$m\n" if $m == 2;
    ++$m unless $m % 2;
    for (my $i = $m; $i <= $n; $i+=2) {
	print "$i\n" if is_prime_cache $i;
    }
    print "\n";
}
