#!/usr/bin/env perl
use strict;
use warnings;
use feature qw( say );

for (1..10) {
    my $length = int(rand(100));
    ++$length unless $length;
    my $in = '';
    #say $length;
    while (--$length >= 0) {
	my $integer = int(rand(10));
	#say $integer;
	if ($integer > 5) {
	    $in .= int(rand(10));
	} elsif ($integer % 2) {
	    $in .= chr(97+int(rand(26)));
	} else {
	    $in .= ' ';
	}
    }
    say "in:";
    say '(', $in, ')';

    say "out:";
    my $out = qx(echo -n "$in"|perl junk-big.pl --encode);
    chomp($out);
    say '(', $out, ')';
    say "decode:";
    chomp(my $decode = qx(echo -n "$out"|perl junk-big.pl --decode));
    say '(', $decode, ')';
    my $status = do {
	if ($in eq $decode) { 'Success' }
	else { 'Failure' }
    };
    say "status:";
    say $status, "\n";
}
