#!/usr/bin/env perl
use strict;
use warnings;

#ensures file does not exist
system('rm out.txt');

my $file1 = shift;
my $file2 = shift;
my $file3 = shift;
my $file4 = shift;

my $out = "out.txt";

open my $fh1, '<', $file1;
open my $fh2, '<', $file2;
open my $fh3, '<', $file3;
open my $fh4, '<', $file4;

open my $out_fh, '>>', $out;

open my $workout, '<', $out;

#make sure four args are present ortherwise it will crash
build_hash($fh1);
build_hash($fh2);
build_hash($fh3);
build_hash($fh4);

my %sim_count;
while (my $line = <$workout>) {
    chomp $line;
    for my $id (split(/\n/, $line)) {
        $sim_count{$id}++;
    }
}

print "CORE IDs: \n";
for my $id (keys %sim_count) {
    if ($sim_count{$id} == 4) {
        print "ID: $id Count: $sim_count{$id} \n";
    }
} 

print "VARIABLE IDs: \n";
for my $id (keys %sim_count) {
    if ($sim_count{$id} < 4) {
        print "ID: $id Count: $sim_count{$id} \n";
    }
}

#why is it being sorted without any sorting program????
sub build_hash {
    my $fh = shift;
    my %hash;    
    while (my $line = <$fh>) {
        chomp $line;
        my ($key, $val) = split /,|\s+/, $line;
        $hash{$key} = $val;
        if ($val >= 50) {
            print $out_fh "$key\n";  
        }
    }
    close $fh;
}
