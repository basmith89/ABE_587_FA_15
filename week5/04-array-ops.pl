#!/usr/bin/env perl
use strict;
use warnings;

my @list = (101, 2, 15, 22, 95, 33, 2, 27, 72 , 15, 52);

print "array = ", join(',', @list), "\n";

my $pop = pop @list;
print "popped = $pop, array = ", join(',',@list), "\n";

my $shifted = shift @list;
print "shifted = $shifted, array = ", join(',',@list), "\n";

push (@list, '12');
print "after push, array = ", join(',',@list), "\n";

unshift (@list, 4);
print "after unshift, array = ", join(',',@list), "\n";
