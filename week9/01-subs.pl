#!/usr/bin/env perl

use strict;
use warnings;
use autodie;
use feature 'say';
use Getopt::Long;
use Pod::Usage;

main();

# --------------------------------------------------
sub main {
    my %args = get_args();

    if ($args{'help'} || $args{'man_page'}) {
        pod2usage({
            -exitval => 0,
            -verbose => $args{'man_page'} ? 2 : 1
        });
    }; 
    my $program  = $args{'program'} or pod2usage('Missing program');
    my $argument = $args{'argument'} or pod2usage('Missing argument');

    if ($program eq 'hello') {
        hello($argument);
    }
    elsif ($program eq 'rc') {
        rc($argument); 
    }
    say "OK";
}

# --------------------------------------------------
sub hello {
    my $name = shift;
    say "Hello, $name";
}

# --------------------------------------------------
sub rc {
    my $seq = shift;
    my $revseq = reverse $seq;
    $revseq =~ tr/ACTGactg/TGACtgac/;
    say $revseq;
}

# --------------------------------------------------
sub get_args {
    my %args;
    GetOptions(
        \%args,
        'program=s',
        'argument=s',
        'help',
        'man',
    ) or pod2usage(2);

    return %args;
}

__END__

# --------------------------------------------------

=pod

=head1 NAME

01-subs.pl - subroutine practice

=head1 SYNOPSIS

  01-subs.pl -p hello -a Name
  01-subs.pl --program rc --argument ATGCGTAGC 

Options:

  --help        Show brief help and exit
  --man         Show full documentation
  --program     Choose a program to run
  --argument    Make an argument for the program to operate on

=head1 DESCRIPTION

This script will either print a Hello, world statement 
or reverse complement a nucleotide sequence depending on what flag arguments
you provide.

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
