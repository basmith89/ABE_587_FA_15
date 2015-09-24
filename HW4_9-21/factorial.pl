#!/usr/bin/env perl
use strict;
use warnings;

my $in = 'numbers.txt';

open my $in_fh, '<', $in or die "Cannot read $! \n";
open my $out_fh, '>', "myresult.txt";

while (my $num = <$in_fh>) {
	chomp $num;
	if ($num % 2 == 0) {
		if ($num < 24) {
			print "$num \n";
		}
	}
	else {
		my $factorial = $num;
		while ($num > 1) {
			$num--;
			$factorial = ($factorial * $num);
		}
		print $out_fh "$factorial \n";
	}
}
	 	
