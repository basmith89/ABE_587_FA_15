#!/usr/bin/env perl
use strict;
use warnings;


print "The numbers to add are: ", join(', ', @ARGV), "\n";

unless(@ARGV) {
	die "No arguments given." ;
};

if ($ARGV[0] ne "" && $ARGV[1] ne "") {
	print "$ARGV[0] + $ARGV[1] = ", $ARGV[0] + $ARGV[1], "\n"; 
#	die "Please provide two numbers. \n";
}
else {	
	die "Please provide two numbers. \n";
}

#print "$ARGV[0] + $ARGV[1] = ", $ARGV[0] + $ARGV[1], "\n"; 
