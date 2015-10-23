#!/usr/bin/env perl
use strict;
use warnings;


unless (@ARGV) {
    die "Please provide a word or phrase.\n";
}

my $str = join ' ', @ARGV;

$str =~ s/[\,|\.|\!|\?|\:|\;|\'|\-]+//g;
(my $lcstr = lc($str)) =~ s/\s//g;

if ($lcstr =~ /^((.)(?1)\2|.?)$/) {
    print "Yes\n";
}
else {
    print "No\n";
}
