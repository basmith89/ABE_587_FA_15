#!/usr/bin/env perl
use strict;
use warnings;

my $gc_count = 0;
my $char = 0;

unless (@ARGV) {
	die "Please provide a sequences. \n";
}

if (@ARGV => 1) {
    my @seq = shift @ARGV; 

    my $seq = join('', @seq);
    print "Seq :$seq \n";

    my $len = length join('', @seq);
    print "Length: $len \n";

    for (my $e = 0; $e < $len; $e++) {
        my $char = substr($seq, $e, 1);
        if ($char eq "G" || $char eq "C" || $char eq "c" || $char eq "g") {
            $gc_count++;
        }
    }

print "#GC : $gc_count \n";
print "%GC : ", ($gc_count/$len) * 100, "\n";
}
