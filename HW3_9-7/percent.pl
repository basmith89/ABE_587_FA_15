#!/usr/bin/env perl
use strict;
use warnings;

my @values = @ARGV;
my $i = $values[0];
my $j = $values[1];

unless (@ARGV) {
	die "No arguments given \n";
}

if ($i + $j != 0) {
	print $i/($i+$j) * 100, "% \n";
}
else {
	die "You are tring to trick me! \n";
}

