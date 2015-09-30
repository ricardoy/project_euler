#!/usr/bin/perl

use POSIX; # ceil and floor functions
use strict;
use 5.10.0;
use Data::Dumper;
use Memoize;

memoize("total_collatz_terms");

my $best_total = -1;
my $best_n = -1;
foreach my $n (1 .. 1_000_000) {
    my $total = total_collatz_terms($n);

    if ($total > $best_total) {
	$best_total = $total;
	$best_n = $n;
    }
}

say $best_n;

sub total_collatz_terms {
    my $n = shift;

    if ($n == 1) {
	return 1;
    }

    if ($n % 2 == 0) {
	return 1 + total_collatz_terms($n / 2);
    } else {
	return 1 + total_collatz_terms($n * 3 + 1);
    }
}
