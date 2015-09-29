#!/usr/bin/perl

use POSIX; # ceil and floor functions
use strict;
use 5.10.0;
use Data::Dumper;

my $n = shift;

my $modulo = 10 ** 10;

my $tot = 0;
foreach my $x(1 .. $n) {
    my $current = $x;

    foreach(2 .. $x) {
	$current = ($current * $x) % $modulo;
    }

    $tot += $current;
}

print $tot % $modulo, "\n";
