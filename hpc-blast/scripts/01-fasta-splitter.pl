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
    use Cwd;    
    use Bio::SeqIO;
    use File::Path qw(make_path);
    use File::Spec::Functions 'catfile';
    use File::Basename 'basename';

    if ($args{'help'} || $args{'man'}) {
        pod2usage({
            -exitval => 0,
            -verbose => $args{'man'} ? 2 : 1
        });
    } 

    @ARGV or pod2usage("Please provide a fasta file");

    my $number = $args{'number'} || 500;
    my $out_dir = $args{'out_dir'} || cwd();
   
    unless (-d $out_dir) {
        make_path($out_dir);
    }
    
    my $fileval;
    #need for loop if multiple args are given 
    for my $file (@ARGV) {
        #my $basename = basename($file);   ##could use this instead of line 57 basename
        my $inseq_object = Bio::SeqIO->new(
            -file=>$file,
            -format=>'fasta',
            );

        my $count  = 0;
        my $fcount = 0;    
        say join ": ", ++$fileval, $file;   

        my $out_seqIO_object;  
        while (my $seq_object = $inseq_object->next_seq) {
            $count++;
            if ($count == 1 || $count % ($number + 1) == 0) {
                $fcount++;
                my $out = catfile($out_dir, basename($file) . '.' . $fcount);
                say "  -> $out";
                $out_seqIO_object = Bio::SeqIO->new(-file=> ">$out", -format=> 'fasta');
            }
            #say join ": ", $count, $seq_object->id;
            $out_seqIO_object->write_seq($seq_object);
        } 
    }

    say "Done";
}
# --------------------------------------------------
sub get_args {
    my %args;
    GetOptions(
        \%args,
        'number=s',
        'out_dir=s',
        'help',
        'man',
    ) or pod2usage(2);

    return %args;
}

__END__

# --------------------------------------------------

=pod

=head1 NAME

01-fasta-splitter.pl - a script

=head1 SYNOPSIS

  01-fasta-splitter.pl -n 20 -o file1.fa [file2.fa...]

Options:

  --number  Give the total number of sequences allowed before split
  --out_dir Designate an output directory
  --help    Show brief help and exit
  --man     Show full documentation

=head1 DESCRIPTION

This program will split a fasta file contianing multiple sequences up
into seperate files given a number to split on.

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
