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

    my $in = '[SCRATCH].in';
    qx(cat /dev/null > $in);

    ###########  INPUT BEGINS HERE  #################
    my $x = (int(rand(2000)) + 1);
    my $y = rand(2000);
    my $s = "printf \"%d %.2f\n\" $x $y >> $in";
    qx($s);
    ###########  INPUT ENDS HERE  ###################

    # print input file contents
    print "in:\n";
    print qx(cat $in);

    # output
    print "c:out:\n";
    print qx(./[SCRATCH]-c < $in);
    print "c++:out:\n";
    print qx(./[SCRATCH]-cc < $in);
    print "perl:out:\n";
    print qx(perl [SCRATCH].pl < $in);
}
