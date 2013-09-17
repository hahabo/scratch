#!/usr/bin/env perl
use strict;
use warnings;

for (1 .. int(rand(20))) {

    # print test header
    sub {
	my $sep = "=";
	my $max = 70;
	my $msg = "TEST# $_";
	print $sep x $max, "\n";
	my $x = ($max - length($msg))/2;
	print " " x $x , $msg, "\n";
	print $sep x $max, "\n";
    }->();

    # input
    my $in = 'TEST.in';
    qx(cat /dev/null > $in);

    for (1 .. int(rand(10))) {
	my $s = "echo " . int(rand(100)) . " >> $in";
	qx($s);
    }

    # print input file contents
    print "in:\n";
    print qx(cat $in);

    # output
    print "c:out:\n";
    print qx(./TEST-c < $in);
    print "c++:out:\n";
    print qx(./TEST-cc < $in);
    print "perl:out:\n";
    print qx(perl TEST.pl < $in);
}
