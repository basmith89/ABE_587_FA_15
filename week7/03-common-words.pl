#!/usr/bin/env perl
use strict;
use warnings;
use autodie;

my %word1;
my @words1;
my %word2;
my @words2;

my $file1 = shift;
my $file2 = shift;

open my $fh1 ,'<', $file1;
#nifty special variable called slurp
#oneliner to read the entire file in at once
undef($/); 
while(<$fh1>){
    #make an array of words by splitting on whitepace
    (@words1)=split(/\s+/);  
}
for (@words1){
    s/[\,|\.|\!|\?|\:|\;|\'|\-]//g; #removed punctuation
    $word1{$_}++;
}


open my $fh2 ,'<', $file2;
#nifty special variable called slurp
#oneliner to read the entire file in at once
undef($/); 
while(<$fh2>){
    #make an array of words by splitting on whitepace
    (@words2)=split(/\s+/);  
}
for (@words2){
    s/[\,|\.|\!|\?|\:|\;|\'|\-]//g; #removed punctuation    
    $word2{$_}++;
}

#Need to lowercase words before adding them to an array for 
#pushing to similarity check array and printing
#otherwise seemingly duplicate keys will be stored. (ie Do and do)
#Probably could have done this earlier but ran into problem at tail end
#so I didn't think about it.
%word1 = map { lc $_ => $word1{$_} } keys %word1;
%word2 = map { lc $_ => $word2{$_} } keys %word2;
my @common = ();
foreach (keys %word1) {
    push(@common, $_) if exists $word2{$_};
}

my $n = scalar(@common);
print join("\n\n", @common);

print "\nFound $n words in common. \n";
