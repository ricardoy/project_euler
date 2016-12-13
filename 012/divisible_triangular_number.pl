#!/usr/bin/perl

use POSIX;
use strict;
use 5.10.0;
use Data::Dumper;

my $x = 1;
while(1) {
    my $t = total_divisors(pa($x));

    if ($t > 500) {
	say pa($x);
	exit;
    }
    $x++;
}
say $x;
    
sub total_divisors {
    my $x = shift;

    my @factors = factorization($x);
    my $result = 1;

    for(my $i = 0; $i < scalar(@factors) / 2; $i ++) {
	my $prime = $factors[2 * $i];
	my $max = $factors[2 * $i + 1];

	$result = $result * ($max + 1);
    }

#    say "total :", $result;

    return $result;
}

sub pa {
    my $x = shift;

    return ((1 + $x) * $x) / 2;
}


sub factorization {
    my $n = shift;

    my $limit = ceil(sqrt($n));

    my @sieve = ();
    for (my $i = 0; $i <= $limit; $i++) {
	$sieve[$i] = 0;
    }

    my @primes = ();
    push @primes, 2;
    for (my $i = 3; $i <= $limit; $i = $i + 2) {
	if ($sieve[$i] == 0) {
	    push @primes, $i;
	    for (my $j = $i; $j <= $limit; $j += $i) {
		$sieve[$j] = 1;
	    }
	}
    }

    my @factors = ();

    for (@primes) {
	my $tot = 0;
	while($n % $_ == 0) {
	    $n = $n / $_;
	    $tot++;
	}

	if ($tot > 0) {
	    push @factors, $_;
	    push @factors, $tot;
	}
    }

    if (scalar(@factors) == 0) {
	push @factors, $n;
	push @factors, 1;
    }

    return @factors;
}
