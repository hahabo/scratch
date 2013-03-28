#!/usr/bin/env perl

# usage:
# perl junk.pl --encode <file>
# perl junk.pl --decode <file>

use strict;
use warnings;
use feature qw( say );
use Data::Dumper;

sub decode {
    my $x = shift;
    die "nice try :)" unless $x =~ /^\d+$/;
    #say $x;

    my %h;
    my $base = 10+26+26+1; # (0..9,a..z,A..Z,' ')
    my $i = 0;
    foreach (10..(10+26-1)) { # (a..z)
	$h{$_} = chr(97+$i++);
    }
    $i = 0;
    foreach ((10+26)..(10+26+26-1)) { # (A..Z)
	$h{$_} = chr(65+$i++);
    }
    $h{10+26+26} = ' ';
    #say Dumper(\%h);

    if ($x >= $base) {
	my @x;
	while (int($x / $base) > 0) {
	    my $val = $x % $base;
	    $val = $h{$val} if $val > 9;
	    push @x, $val;
	    $x = int($x / $base);
	}
	my $val = $x;
	$val = $h{$val} if $val > 9;
	push @x, $val;
	reverse @x;
    }
    else {
	my $val = $x;
	$val = $h{$val} if $val > 9;
	$val;
    }
}

sub encode {
    my $x = shift;
    die "nice try :)" unless $x =~ /^[a-zA-Z0-9 ]+$/;
    my @x = split //,$x;
    my %h;
    my $i = 10;
    foreach ('a'..'z') {
	$h{$_} = $i++;
    }
    foreach ('A'..'Z') {
	$h{$_} = $i++;
    }
    $h{' '} = $i;
    
    #say Dumper(\%h);
    $i = @x - 1;
    my $base = 10+26+26+1;
    my $sum = 0;
    foreach (@x) {
	#say $i, ' ', $_;
	if (/^\d+$/) {
	    $sum += ($base**$i)*$_;
	} else {
	    $sum += ($base**$i)*$h{$_};
	}
	--$i;
    }
    $sum
}

my $flag = shift;
if ($flag eq '--decode') {
    say decode <>;
} else {
    say encode  <>;
}
