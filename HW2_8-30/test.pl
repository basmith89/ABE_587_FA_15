#!/usr/bin/perl
#file test.pl
use strict;
use warnings;


print "When that Aprill with his shoures soote\n";
print "2+2 =", 2+2 , "\n";


print "This directory contains: ";
#system allows you to perform unix commands 
system "ls";

my $time = localtime;
print "The local time is $time\n";
