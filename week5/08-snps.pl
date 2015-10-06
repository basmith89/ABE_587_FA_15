#!/usr/bin/env perl
use strict;
use warnings;

unless (@ARGV == 2) {
	die "Please provide two sequences. \n";
}

my $seq1 = $ARGV[0];
my $seq2 = $ARGV[1];

#necessary for, for loop
my $len = length($seq1);

#Check if parametes are correct
#if so proceed into for loop for comparison
unless (length($seq1) == (length($seq2))) { 
    die "Please ensure the sequences are the same length. \n";
}
elsif ($seq1 eq $seq2) {
    print "Found 0 SNPs. \n";
}
else {
    my $count = 0;
    for (my $e = 0; $e < $len; $e++) {
        #extract single string for comparison
        my $char1 = substr($seq1, $e, 1);
        my $char2 = substr($seq2, $e, 1);
        if ($char1 ne $char2) {
            print "Pos ", $e + 1, ": $char1 => $char2 \n";
            #create count for number of snps found
            $count++;
        }
    }
    if ($count == 1) {
        print "Found 1 SNP. \n";
    }
    else {
        print "Found $count SNPs \n";
    }
}

