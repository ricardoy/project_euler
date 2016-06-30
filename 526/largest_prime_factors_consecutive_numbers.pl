#!/usr/bin/perl

use POSIX; # ceil and floor functions
use strict;
use 5.10.0;
use Data::Dumper;

my @primes = get_primes();

foreach(@primes) {
    say $_;
}

sub get_primes {
    my $limit = ceil(sqrt(10 ** 16) + 8);
    
    my @sieve = ();
    
    foreach(0 .. $limit) {
	$sieve[$_] = 0;
    }

    my @result = ();
    push @result, 2;
    for(my $i = 3; $i <= $limit; $i += 2) {
	if ($sieve[$i] == 0) {
	    push @result, $i;
	    for(my $j = $i; $j <= $limit; $j = $j + $i) {
		$sieve[$j] = 1;
	    }
	}
    }

    return @result;
}
