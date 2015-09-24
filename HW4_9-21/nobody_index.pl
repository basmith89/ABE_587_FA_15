#!/usr/bin/env perl
use strict;
use warnings;

my $in = 'Perl_III.nobody.txt';

open my $in_fh, '<', $in or die "Cannot read $!. \n";
my $linecount = 0;

while (my $line = <$in_fh>) {
	chomp $line;
	$linecount++;
	my $nobody = index($line, 'Nobody');
	my $somebody = index($line, 'somebody');
	if ($nobody >= 0) {
		print "Nobody Position on line: ", $linecount++," Position: ", ($nobody + 1), "\n";
	}
	elsif ($somebody >= 0) {
		warn "Somebody here on line: ", $linecount++," Position: ", ($somebody + 1), "\n";
	}
}

