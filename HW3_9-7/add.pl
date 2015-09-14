#!/usr/bin/env perl
use strict;
use warnings;


print "The numbers to add are: ", join(', ', @ARGV), "\n";

unless(@ARGV) {
	die "No arguments given." ;
};

print "$ARGV[0] + $ARGV[1] = ", $ARGV[0] + $ARGV[1], "\n"; 
