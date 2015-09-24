#!/usr/bin/env perl
use strict;
use warnings;

#Create script with for loop for each line of fasta, 
#then if line does not start with '>' do work

my $seq = 'Perl_III.fasta.txt';
my $out = 'revcomp_fasta.txt';

open my $seq_fh, '<', $seq or die "Cannot read $!. \n";
open my $out_fh, '>', $out;

foreach my $line (<$seq_fh>) {
	chomp $line;
	if ($line =~ /^>/) {
		print $out_fh "$line \n";
	}
	else {
		my $revline = reverse $line;
		$revline =~ tr/ACTG/TGAC/;
		print $out_fh "$revline \n";
	}
}
