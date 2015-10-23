#!/usr/bin/env perl
use strict;
use warnings;
use autodie;

my $in = shift or die "Please provide a FASTA file.\n";
open my $in_fh, '<', $in;

my $c = 1;

while (my $seqline = <$in_fh>) {
    if ($seqline =~ /^>(.*)/g) {
        print "$c: $1\n"; #use $1 for perl capture notation, (.*) 
        ++$c;
    }
} 

if ($c == 2) {
    print "Found ",$c-1, " sequence.\n";
}
else {
    print "Found ",$c-1, " sequences.\n";
}
