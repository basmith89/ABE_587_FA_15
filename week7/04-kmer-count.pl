#!/usr/bin/env perl
use strict;
use warnings;
use autodie;


unless (@ARGV >= 1) {
    die "Please provide a sequence. \n";
}

my $in = 'mouse.fa';
open my $in_fh, '<', $in;

my $inseq = $ARGV[0];
my $ksize = $ARGV[1];

#if first arg is a file this will read it
if ($inseq eq $in) {
    $inseq = <$in_fh>;
}

#Check for kmer arg
if (defined $ARGV[1]) {
    unless ($ksize =~ /[0-9]/) {
        die "2nd argument is the kmer size, please provide a number\n";
    }
}
#defualt ksize
else {
    $ksize = 3;
}

my $seq_len = length $inseq;
my $total_kmers = $seq_len - $ksize + 1;
my %kmers;

my @kmerlist;
my @vallist;
my $kcount = 0;

#add an if statement that checks if the key is already present
#create or add count to value of that motif key

for (my $i=0; $i <= (length($inseq)-$ksize); $i++) {
    my $kmerstr=substr  $inseq, $i,$ksize;
    $kmers{$kmerstr}++;
    my $window = substr $inseq, $i, $ksize;
    if ($window eq $kmerstr) {
        $kcount++;
    }
} 

my $singleton = 0;
for my $kmerstr (keys %kmers) {
    my $count = $kmers{$kmerstr};
    #this push bit is used to count unique kmers 
    #by getting its scalar val later
    push @kmerlist, $count;
    #Count keys with only 1 value pair
    if ($count == 1) {
        $singleton++;
    }
}
print "Sequence length\t$seq_len\n";
print "Mer size\t$ksize\n";
print "Number of kmers\t$kcount\n";
print "Unique kmers\t", scalar(@kmerlist), "\n";
print "Num. singletons\t$singleton \n";

#Output the hash to stdout
#If statement reports top ten by using $c as a counter up to 10
my $c = 0;
print "Most abundant\n";
for my $kmerstr (sort { $kmers{$b} <=> $kmers{$a} } keys %kmers) {
    if ($c > 10) {
        last;
    }
    else{     
        my $count = $kmers{$kmerstr};
        if ($count > 1) {
            print "$kmerstr: $count\n\n";
        }
        $c++;
    }
}   
