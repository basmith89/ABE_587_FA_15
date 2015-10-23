#!/usr/bin/env perl
use strict;
use warnings;
use autodie;


unless (@ARGV) {
    die "Please provide a sequence or file.\n"
}

my $seq = shift;
open my $in_fh, '<', $seq;


($seq = join '', <$in_fh>)  =~ s/\s//g;

$seq =~ s/([GA])AATT([CT])/$1\^AATT$2/g; 
print "$seq\n";
