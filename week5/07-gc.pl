#!/usr/bin/env perl
use strict;
use warnings;

my $gc_count = 0;
my $char = 0;

unless (@ARGV) {
    die "Please provide a sequences. \n";
}

for my $seq (@ARGV) {
    print "Seq :$seq \n";

    my $len = length $seq;
    print "Length: $len \n";

    for ( my $e = 0 ; $e < $len ; $e++ ) {
        my $char = substr( $seq, $e, 1 );
        if ( $char eq "G" || $char eq "C" || $char eq "c" || $char eq "g" ) {
            $gc_count++;
        }
    }

    print "#GC : $gc_count \n";
    print "%GC : ", ( $gc_count / $len ) * 100, "\n";
}

__END__

Failed to handle multiple arguments.  

One point off.
