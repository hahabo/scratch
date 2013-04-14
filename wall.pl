#!/usr/bin/env perl

# This script sets the wallpaper of the lxde desktop
# by downloading a wallpaper from National Geographic
# website.

use strict;
use warnings;
use File::Basename;
use File::Spec;

my $debug = 0;

sub random_wallpaper {
  # chose a random wallpaper from $directory
  my $directory = shift;
  my @files = glob "$directory/*.jpg $directory/*.png";
  return $files[int(rand(@files))];
}

# url of the national geography photo of the day
my $url =
  'http://photography.nationalgeographic.com/photography/photo-of-the-day';

# download directory
my $directory = '/home/ppm/wallpaper';
my $full_path;

use WWW::Mechanize;
my $mech = WWW::Mechanize->new();

eval { $mech->get( $url ) };
unless ( $@ ) {
  my $link = $mech->find_link( text_regex => qr/Download Wallpaper/ );

  if ($link) {
    my $img_url = $link->url();
    my $basename = basename($img_url);
    $full_path = File::Spec->catfile($directory, $basename);
    print $full_path if $debug;
    unless ( -e $full_path ) {	# wallpaper already exists
      qx/wget --quiet --directory-prefix=$directory $img_url/;
      unless ($?) {		# download failure
	$full_path = random_wallpaper($directory);
      }
    }
  } else {
    $full_path = random_wallpaper($directory);
  }
} else {			# any download issue
  $full_path = random_wallpaper($directory);
}

# set the wallpaper
qx/pcmanfm --set-wallpaper="$full_path"/;

exit 0;
