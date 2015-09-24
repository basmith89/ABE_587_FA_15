#!/usr/bin/env perl
use strict;
use warnings;

my $in = 'Perl_III.fastq.txt';

open my $in_fh, '<', $in or die "Cannot read $! \n";

my ($lines, $chars) = (0,0);

while (<$in_fh>) {
	$lines++;
	$chars += length($_);
}

print "Lines = $lines
Characters = $chars
Avergae length = ", ($chars / $lines), "\n";
