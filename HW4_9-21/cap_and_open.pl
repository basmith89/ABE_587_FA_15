#!/usr/bin/env perl
use strict;
use warnings;

my $capout = 'cap_out.txt';
my $infile = 'test.txt';

open my $in_fh, '<' , $infile or die "Cannot read $infile: $!;\n";
open my $capout_fh, '>', $capout;

print $capout_fh uc(<$in_fh>);

#foreach my $i (<$in_fh>) {
#	print $capout_fh uc($i);
#}
