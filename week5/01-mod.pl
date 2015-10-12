#!/usr/bin/env perl
use strict;
use warnings;

my @evens;

unless (@ARGV) {
	die "Please provide a list of number. \n";
}

for my $e (@ARGV) {
	if ($e % 2 == 0) {
		push @evens, $e;
	}
}
#is there a way to avoid doing this step?
#shift @evens, 0;

print "evens = @evens \n";

__END__

Just declaring the array @evens is sufficient.  
