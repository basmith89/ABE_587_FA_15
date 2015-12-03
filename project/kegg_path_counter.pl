#!/usr/bin/env perl

use strict;
use warnings;
use autodie;
use feature 'say';
use Getopt::Long;
use Pod::Usage;
use Cwd;

my %opts = get_opts();
my @args = @ARGV;

if ($opts{'help'} || $opts{'man'}) {
    pod2usage({
        -exitval => 0,
        -verbose => $opts{'man'} ? 2 : 1
    });
}

#Start script here.
#ARGV will hold input files from uproc

@ARGV or pod2usage("Please provide uproc files");

my $out_dir = $opts{'out_dir'} || cwd();
my $keggpaths = $opts{'lookup_key_file'} || 'kegg_to_path';

unless (-d $out_dir) {
    make_path($out_dir);
}

open my $keggpaths_fh, '<', $keggpaths;
my ($count, $path) = 0;
my @print;


my %kegg_path_lookup;
while (<$keggpaths_fh>) {
    my ($ko, $path) = split("\t");
    push @{$kegg_path_lookup{$ko}}, $path;
}
#use Data::Dumper;
#say Dumper(\%kegg_path_lookup);

####normalization step somthing like:
####count/(total # sample * avg)

my %path_sample_ct;
for my $file(@ARGV) {
    open my $fh, '<', $file;
    while (<$fh>) {
        chomp;
        my ($ko, $count) = split(',');
        for my $path(@{$kegg_path_lookup{$ko}}) {
            if (!exists $path_sample_ct{$path}{$file}) {
                $path_sample_ct{$path}{$file} = $count;
            }
            else {
                my $current_count = $path_sample_ct{$path}{$file};
                my $new_count = $count + $current_count;
                $path_sample_ct{$path}{$file} = $new_count;
                #chomp $path;
                #print "$path \t $count\n";
            }

        }
    }
    #$count = $path_sample_ct{$path}{$file};
    #print $count;
}

for my $path (keys %path_sample_ct) {
    my @print= ();
    for my $file(@ARGV) { 
        my $count = $path_sample_ct{$path}{$file};
        push (@print, $count);
    }
}

print "$path \t", join(@print, "\t");

#print $count;

say "OK";

# --------------------------------------------------
sub get_opts {
    my %opts;
    GetOptions(
        \%opts,
        'help',
        'man',
        'lookup_key_file=s',
        'out_dir=s',
    ) or pod2usage(2);

    return %opts;
}

__END__

# --------------------------------------------------

=pod

=head1 NAME

kegg_path_counter.pl - a script

=head1 SYNOPSIS

  kegg_path_counter.pl 

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
