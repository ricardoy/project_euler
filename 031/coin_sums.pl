#!/usr/bin/perl

use POSIX; # ceil and floor functions
use strict;
use 5.10.0;
use Data::Dumper;
use Memoize;

memoize('solution_r');

my @coins = qw(1 2 5 10 20 50 100 200);

foreach(<STDIN>) {
    chomp;

    my @tokens = split(/\|/);

    my $expected = $tokens[1];

    my $s = solution($tokens[0]);
    if ($s != $expected) {
	print STDERR $tokens[0], " (expected $expected, got $s)\n";
    }
}

sub solution {
    my $n = shift;

    return solution_r($n, 7);   
}

sub solution_r {
    my ($n, $k) = @_;

    if ($n < 0 || $k < 0) {
	return 0;
    }

    if ($n == 0) {
	return 1;
    }

    return solution_r($n, $k-1) + solution_r($n - $coins[$k], $k);
}
