#!/usr/bin/env perl

use strict;
use warnings;
use autodie;
use feature 'say';
use Getopt::Long;
use Pod::Usage;
use Bio::SeqIO;

my %opts = get_opts();
my @args = @ARGV;

if ($opts{'help'} || $opts{'man'}) {
    pod2usage({
        -exitval => 0,
        -verbose => $opts{'man'} ? 2 : 1
    });
}

unless (@ARGV) {
    pod2usage();
}

for my $file (@ARGV) {
    my $in = Bio::SeqIO->new (-file => $file, -format=> 'Genbank');
    my $count = 0;
    
    while (my $seq = $in->next_seq) {
        #sort sequences using -> display_name?
        #grep should be named filter as this is what it is doing.
        my @cds = grep { $_->primary_tag eq 'CDS' } $seq->top_SeqFeatures; #get->SeqFeatures 
        #####say Dumper(\@cds); use Data::Dumper;
        my $seq_id = $seq->id;
        my $cds_val = scalar @cds;
        #reset counter if there is a new id
        if ($cds_val == 1) { $count = 0; }
        say "$seq_id has $cds_val CDS";
        for my $cds (@cds) {
            $count++;
            say "$count: ", $cds->get_tag_values('translation');
        }
    }
}


# --------------------------------------------------
sub get_opts {
    my %opts;
    GetOptions(
        \%opts,
        'help',
        'man',
    ) or pod2usage(2);

    return %opts;
}

__END__

# --------------------------------------------------

=pod

=head1 NAME

03-find-cd.pl - a script

=head1 SYNOPSIS

  03-find-cd.pl file.gb [file2.gb ...] 

Options:

  --help   Show brief help and exit
  --man    Show full documentation

=head1 DESCRIPTION

The program will read a genbank file(s) given as arguments and
print the ID, how many CDSs were found for that ID, and the 
protein coding sequences. 

=head1 SEE ALSO

perl.

=head1 AUTHOR

Brian Smith E<lt>basmith@email.arizona.eduE<gt>.

=head1 COPYRIGHT

Copyright (c) 2015 basmith

This module is free software; you can redistribute it and/or
modify it under the terms of the GPL (either version 1, or at
your option, any later version) or the Artistic License 2.0.
Refer to LICENSE for the full license text and to DISCLAIMER for
additional warranty disclaimers.

=cut
