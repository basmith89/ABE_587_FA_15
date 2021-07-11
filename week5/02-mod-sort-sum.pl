#!/usr/bin/env perl
use strict;
use warnings;

my @evens = 0;
my @odds = 0;

unless (@ARGV) {
	die "Please provide a list of number. \n";
}

for my $e (@ARGV) {
	if ($e % 2 == 0) {
		push @evens, $e;
	}
	else {
		push @odds, $e;
	}
}

#could write a subroutine but this was shorter for what was needed.
print "sum evens = ", (eval(join('+',@evens))), "\n";
print "sum odds = ", (eval(join('+',@odds))), "\n";

__END__

Clever use of "eval," but very dangerous.

Perl6 allows this:

  say "sum evens = ", [+] @evens;

Better to use a scalar to accumulate the values.
