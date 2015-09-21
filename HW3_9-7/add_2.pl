#!/usr/bin/env perl
use strict;
use warnings;


unless(@ARGV) {
	die "No arguments given." ;
}

print "The numbers to add are: ", join(', ', @ARGV), "\n";

my $val1 = $ARGV[0];
my$val2 = $ARGV[1];


if ($val1 ne "" && $val2 ne "") {
	print "$val1 + $val2 = ", $val1 + $val2, "\n"; 
#	die "Please provide two numbers. \n";
}
else {	
	die "Please provide two numbers. \n";
}

#print "$ARGV[0] + $ARGV[1] = ", $ARGV[0] + $ARGV[1], "\n"; 
