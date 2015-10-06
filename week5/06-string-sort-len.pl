#!/usr/bin/env perl
use strict;
use warnings;


unless (@ARGV) {
	die "Please provide a list of sequences. \n";
}

my @sorted = join(',', sort({length $a <=> length $b} @ARGV));
print "sorted = @sorted \n";

my @revsort = join(',', reverse(sort( {length $a <=> length $b} @ARGV)));
print "reverse = @revsort \n";
