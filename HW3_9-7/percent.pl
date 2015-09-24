#!/usr/bin/env perl
use strict;
use warnings;



unless (@ARGV) {
	die "No arguments given \n";
}

my @values = @ARGV;
my $i = pop @values;
my $j = pop @values;


if ($i + $j != 0) {
	print $i/($i+$j) * 100, "% \n";
}
else {
	die "You are tring to trick me! \n";
}

