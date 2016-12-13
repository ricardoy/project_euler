#!/usr/bin/perl

use POSIX; # ceil and floor functions
use strict;
use 5.10.0;
use Data::Dumper;

my @sieve = ();

my $limit = 10_010_000;
my $min = 10_000_000;

foreach(0 .. $limit) {
    $sieve[$_] = 0;
}

my @primes = ();
for my $n (2 .. $limit) {
    if ($sieve[$n] == 0) { # prime found
	if ($n > $min) {
	    push @primes, $n;
	}

	my $not_prime = $n * 2;

	while($not_prime <= $limit) {
	    $sieve[$not_prime] = 1;
	    $not_prime += $n;
	}
    }
}

foreach(@primes) {
    print $_, "\n";
}
