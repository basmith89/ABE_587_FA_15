#!/usr/bin/env perl
use strict;
use warnings;
use autodie;


unless (@ARGV) {
    die "Please provide a sequence or file.\n"
}

my $in = shift;
open my $in_fh, '<', $in;


while (my $seqline = <$in_fh>) {
    chomp $seqline;
    if ($seqline =~ s/([GA])AATT([CT])/$1\^AATT$2/g) { #use translation to insert carrot?
        print $seqline;
    }
} 

