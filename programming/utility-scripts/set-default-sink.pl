#!/usr/bin/env perl

use strict; use warnings;

my $target = $ARGV[0];

# my @sinks = `pacmd list-sinks` =~ m/index: (\d*).*?alsa.card_name = "$target"/gs;
my @sinks = `pacmd list-sinks` =~ m/index: (\d*).*?alsa.card_name = "(.*?)"/gs;
# my @sinks = `pacmd list-sinks` =~ m/desc(.*)Stereo(.*)/g;

foreach (@sinks) {
    print("$_\n");
}

# print(@sinks);

# my $inputs = `pacmd list-sink-inputs`;
# my @ids = $inputs =~ m/index: (\d*)/g;

# foreach ( @ids ) {
#     `pacmd move-sink-input $_ $target`
# }
