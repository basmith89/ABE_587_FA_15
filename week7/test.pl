use strict;
use warnings;

my $string="ACGTTGCATGTCGCATGATGCATGAGAGCT";
my $kmer=4;
my %myHash;
my $max=0;

for (my $aa=0; $aa<=(length($string)-4); $aa++) {
    my $myStr=substr  $string, $aa,$kmer;
    print "$myStr\n";
    my $km=kmerMatch ($string, $myStr, $kmer);
    if ($km > $max) { $max = $km;}
        #print "$km\t$myStr\n";
        $myHash{$myStr}=$km;
                       
}
    
#Print all key which have matching values
foreach my $name (keys %myHash){
    print "$name " if $myHash{$name} == $max;
}
    
sub kmerMatch { #Check the exact matching kmers with sliding window
    my ($string, $myStr, $kmer)=@_;
    my $count=0;
    for (my $aa=0; $aa<=(length($string)-4); $aa++) {
        my $myWin=substr  $string, $aa,$kmer;
        if ($myWin eq $myStr) {
        #print "$myWin eq $myStr\n";
        $count++;
        }
    }
    return $count;
}
