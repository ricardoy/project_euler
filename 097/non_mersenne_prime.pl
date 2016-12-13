#!/usr/bin/perl

use POSIX; # ceil and floor functions
use strict;
use 5.10.0;
use Data::Dumper;

my $total_digits = 10;

my $module = 10 ** 10;

my $n = 1;
foreach(1 .. 7830457) {
    $n = $n * 2;

    $n = $n % $module;
}

$n = ($n * 28433 + 1) % $module;

say $n;
