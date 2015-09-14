#!/usr/bin/env perl
use strict;
use warnings;

my @sort_arg = sort(@ARGV);

#Why won't this work when comparing the arrays as a whole?
if ($sort_arg[0] eq $ARGV[0]) {
	print "Right order. \n";
}
else {
	print "Wrong order. \n";
}

