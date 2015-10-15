#!/usr/bin/env perl
use strict;
use warnings;
use autodie;

my $in = 'Perl_V.genesAndSeq.txt';

open my $in_fh, '<', $in;

my %hash;
my $key = "";

while (my $line = <$in_fh>) {
    chomp $line;
    if ($line =~ /^>/) {
        #substr strips first char
        $key = substr($line, 1);
    }
    else {
        #why does this have to be .= and not just =?
        $hash{$key} .= $line;
    }
}
for my $key (sort { $hash{$b} cmp $hash{$a} } keys %hash) {
    my $value = length $hash{$key};
    print "$key: $value \n";
}

