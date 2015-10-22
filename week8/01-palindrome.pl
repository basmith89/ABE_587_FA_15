#!/usr/bin/env perl
use strict;
use warnings;


unless (@ARGV) {
    die "Please provide string. \n";
}

my $str = join ' ', @ARGV;

$str =~ s/[\,|\.|\!|\?|\:|\;|\'|\-]+//g;
(my $lcstr = lc($str)) =~ s/\s//g;

if ($lcstr =~ /^((.)(?1)\2|.?)$/) {
    print "yes! \n";
}
else {
    print "no!\n";
}
