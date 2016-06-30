#!/usr/bin/perl

use strict;

my $limit = 2_000_000;


my @sieve = ();
foreach(0 .. $limit) {
    $sieve[$_] = 0;
}

my $sum = 0;
foreach my $factor(2 .. $limit) {
    if ($sieve[$factor] == 0) { #prime found
	$sum += $factor;

	my $non_prime = $factor * 2;
	while($non_prime <= $limit) {
	    $sieve[$non_prime] = 1;
	    $non_prime += $factor;
	}
    }    
}


print $sum, "\n";
