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

    my $in = 'INTEST.in';
    qx(cat /dev/null > $in);

    ###########  INPUT BEGINS HERE  #################
    my $x = int(rand(10_0)) + 1;
    my $y = int(rand(10_0)) + 1;
    my $s = "printf \"%d %d\n\" $x $y >> $in";
    qx($s);
    for (1 .. $x) {
	my $z = int(rand(10_0)) + 1;
	$s = "printf \"%d\n\" $z >> $in";
	qx($s);
    }
    ###########  INPUT ENDS HERE  ###################

    # print input file contents
    print "in:\n";
    print qx(cat $in);

    # output
    print "c:out:\n";
    print qx(./INTEST-c < $in);
    print "c++:out:\n";
    print qx(./INTEST-cc < $in);
    print "perl:out:\n";
    print qx(perl INTEST.pl < $in);
}
