#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';
use Data::Dumper;

my %cities = (
    Tucson => 'AZ',
    Boston => 'MA',
    Jackson => 'MS',
    Dixon => 'NM',
    Cincinnati => 'OH',
);

say Dumper(\%cities);

