#!/usr/bin/env perl
use strict;
use warnings;
use File::Spec;
use File::Copy;

die "Project name must!" unless @ARGV > 0;
die "Initial directory name must!" unless @ARGV > 1;

die "Prject name must be human readable!"
    unless length($ARGV[0]) > 0;

die "Initial directory must be human readable!"
    unless length($ARGV[1]) > 0;

die "Initial directory must exist!"
    unless -d $ARGV[1] and -e $ARGV[1];

my $project_name = $ARGV[0];
my $init_dir_name = $ARGV[1];

my $project_dir = File::Spec->catdir($init_dir_name, $project_name);

mkdir $project_dir || die "Can't mkdir $project_dir. $!";

my @init_files = qw(Makefile [SCRATCH].c [SCRATCH].cc [SCRATCH].pl try-[SCRATCH].pl);

init($_, $project_dir) foreach @init_files;

sub init {
    my ($file, $project_dir) = @_;

    open my $in_file, '<', $file
	or die "Can't open $file. $!";

    $file =~ s/\[SCRATCH\]/$project_name/g;
    my $path = File::Spec->catfile($project_dir, $file);

    open my $out_file, '>', $path
	or die "Can't open $path. $!";

    while (my $line = <$in_file>) {
	$line =~ s/\[SCRATCH\]/$project_name/g;
	print $out_file $line;
    }

    close $out_file;
    close $in_file;
}
