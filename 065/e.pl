#!/usr/bin/perl

use POSIX; # ceil and floor functions
use strict;
use 5.10.0;
use Data::Dumper;
use bignum;

my $n = shift;
$n--;

my ($x, $y) = solution($n);

print "$x / $y\n";

print sum_terms($x), "\n";

sub sum_terms {
    my $n = shift;

    my $number_digits = ceil(log($n) / log(10));

    my $result = 0;
    foreach(0 .. $number_digits - 1) {
	$result += substr($n, $_, 1);
    }

    return $result;
}

sub solution {
    my $n = shift;

    if ($n == 0) {
	return (2,1);
    } elsif ($n == 1) {
	return (3,1);
    }

    my ($x, $y) = r($n, 1);

    return (2 * $y + $x, $y);
}

sub r {
    my $n = shift;
    my $i = shift;


    my $c;
    if (($i + 1) % 3 == 0) {
	$c = 2 * ($i + 1) / 3;
    } else {
	$c = 1;
    }
    
    if ($n == $i) {
	return (1, $c);
    }

    my ($x, $y) = r($n, $i+1);

    return ($y, $y * $c + $x);

}
