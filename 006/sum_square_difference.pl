#!/usr/bin/perl

use strict;;

my $square_sum = (((1 + 100) * 100) / 2) ** 2;

my $sum_square = 0;

foreach(1 .. 100) {
    $sum_square += ($_ * $_);
}

print abs($sum_square - $square_sum), "\n";

# Formula for the sum of the squares
# n * (n + 1) * (2n + 1) / 6
