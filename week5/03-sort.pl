#!/usr/bin/env perl
use strict;
use warnings;


unless (@ARGV) {
	die "Please provide a list of number. \n";
}

my @sorted = sort(join(',', @ARGV));
print "defualt sort = ",  @sorted, "\n";

my @num_sorted = sort { $a <=> $b } @ARGV;
print "numerical sort = ", join(',', @num_sorted), "\n";

print "reverse numerical sort = ", join(',', reverse(@num_sorted)), "\n";
