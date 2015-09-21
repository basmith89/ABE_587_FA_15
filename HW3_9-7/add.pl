#!/usr/bin/env perl
use strict;
use warnings;

unless(@ARGV) {
	die "No arguments given." ;
};

print "The numbers to add are: ", join(', ', @ARGV), "\n";


print "$ARGV[0] + $ARGV[1] = ", $ARGV[0] + $ARGV[1], "\n"; 
