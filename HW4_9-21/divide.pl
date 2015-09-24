#!/usr/bin/env perl
use strict;
use warnings;


my $stdout = 'out.txt';
my $stderr = 'err.text';

open my $stdout_fh, '>', $stdout;
open my $stderr_fh, '>', $stderr;

if (scalar(@ARGV) != 2) {
	die "I need two values. \n";
}

my @values = @ARGV;
my $i = shift @values;
my $j = shift @values;


if ($i >= 0 && $j > 0) {
	print $stdout_fh  "$i divided by $j = ", $i/$j, "\n";
}
else {
	print $stderr_fh "Values must be positive and the divisor cannot be 0 \n";
}
