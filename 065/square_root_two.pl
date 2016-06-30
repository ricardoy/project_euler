#!/usr/bin/perl

use POSIX; # ceil and floor functions
use strict;
use 5.10.0;
use Data::Dumper;

my $n = shift;

print Dumper solution($n);

sub solution {
    my $n = shift;

    if ($n == 1) {
	return (1,1);
    }

    my ($x, $y) = r($n-1);

    return (1 * $y + $x, $y);
}

sub r {
    my $n = shift;

    if ($n == 1) {
	return (1, 2);
    }

    my ($x, $y) = r($n-1);

    return ($y, (2 * $y + $x));
}
