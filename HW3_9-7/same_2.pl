#!/usr/bin/env perl
use strict;
use warnings;

print "Enter string 1: ";
my $string1 = <>;
print "Enter string 2: ";
my $string2 = <>;

if (lc($string1) eq lc($string2)) {
	print "same \n";
}
else {
	print "different \n";
}
