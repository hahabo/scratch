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

    my $in = 'FCTRL.in';
    qx(cat /dev/null > $in);

    ###########  INPUT BEGINS HERE  #################
    my $x = (int(rand(1_00)));
    my $s = "printf \"%d\n\" $x >> $in";
    qx($s);
    for (1 .. $x) {
	my $y = int(rand(1_000_000)) + 1;
	$s = "echo $y >> $in";
	qx($s);
    }
    ###########  INPUT ENDS HERE  ###################

    # print input file contents
    print "in:\n";
    print qx(cat $in);

    # output
    print "c:out:\n";
    print qx(./FCTRL-c < $in);
    print "c++:out:\n";
    print qx(./FCTRL-cc < $in);
    print "perl:out:\n";
    print qx(perl FCTRL.pl < $in);
}
