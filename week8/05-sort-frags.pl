#!/usr/bin/env perl
use strict;
use warnings;

my @frags;

for (my $seq = <>) {
    @frags = split /\^/, $seq;
    #print @frags;
}

my @sorted_frags = sort { length $a <=> length $b } @frags;
print join("\n", @sorted_frags);
print "\n";
