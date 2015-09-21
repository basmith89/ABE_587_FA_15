#!/usr/bin/env perl
use strict;
use warnings;


unless(@ARGV) {
	die "No arguments given." ;
};


print "The numbers to add are: ", join(', ', @ARGV), "\n";

my $val1 = $ARGV[0];
my $val2 = $ARGV[1];


if (($val1 ne "" && $val2 ne "")  && ($val1 == abs($val1) && $val2 ==abs($val2))) {
	print "$val1 + $val2 = ", $val1 + $val2, "\n";
}
else {	
	die "Please provide two positive numbers. \n";
};

