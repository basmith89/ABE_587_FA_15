#!/usr/bin/env perl
use strict;
use warnings;


unless (@ARGV) {
	die "No arguments given \n";
}

my @values = @ARGV;
my $i = shift @ARGV;
my $j = pop @ARGV;


if ($i + $j != 0) {
	my $percent = $i/($i+$j) * 100;
	printf("%.2f %s", $percent,"% \n");
}
else {
	die "You are tring to trick me! \n";
}

