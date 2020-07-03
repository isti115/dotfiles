#!/usr/bin/env perl

use strict; use warnings;

my $target = $ARGV[0];

my $inputs = `pacmd list-sink-inputs`;
my @ids = $inputs =~ m/index: (\d*)/g;

foreach ( @ids ) {
    `pacmd move-sink-input $_ $target`
}
