#!/usr/bin/perl

use strict;

my $x = 600851475143;

my $limit = int(sqrt($x));

my @sieve = ();
foreach(0 .. $limit) { # initializing
    $sieve[$_] = 0;
}

my $largest_prime_factor = 0;
foreach my $factor(2 .. $limit) {
    if ($sieve[$factor] == 0) { #prime found
	if ($x % $factor == 0) {
	    $largest_prime_factor = $factor;
	}

	my $y = $factor;
	while($y <= $limit) {
	    $sieve[$y] = 1;
	    $y += $factor;
	}
    }    
}

print $largest_prime_factor, "\n";
