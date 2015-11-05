#!/usr/bin/env perl

use strict;
use warnings;
use autodie;
use feature 'say';
use Getopt::Long;
use Pod::Usage;
use Bio::SeqIO;
use Bio::DB::Fasta;


my %opts = get_opts();
my @args = @ARGV;

if ($opts{'help'} || $opts{'man'}) {
    pod2usage({
        -exitval => 0,
        -verbose => $opts{'man'} ? 2 : 1
    });
}

unless (@ARGV == 2) {
    pod2usage();
}

my ($file, $pattern) = @args;

my $db = Bio::DB::Fasta->new($file);
say "Searching '$file' for '$pattern'";

#get_all_primary_ids gives an array of all 
#the primary_ids of the seq obj in database
my @id_list = grep {/$pattern/} $db->get_all_primary_ids;

my $idval = scalar(@id_list);
say "Found $idval ids.";

if ($idval > 0) {
    (my $fname = $pattern); 
    $fname .= '.fa';
    my $out = Bio::SeqIO->new(-file=> ">$fname", -format=> 'fasta');
    
    for my $idout (@id_list) {
        if (my $seq = $db->get_Seq_by_id($idout)) {
            $out->write_seq($seq);
        }
    }
    say "See results in '$fname'";
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

02-fasta-search.pl - a script

=head1 SYNOPSIS

  02-fasta-search.pl 

Options:

  --help   Show brief help and exit
  --man    Show full documentation

=head1 DESCRIPTION

Describe what the script does, what input it expects, what output it
creates, etc.

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
