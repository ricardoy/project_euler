#!/usr/bin/perl

use POSIX; # ceil and floor functions
use strict;
use 5.10.0;
use Data::Dumper;

my $total_digits = shift;
my $value = shift;

my @primes = ();
my @feasible_primes = ();

if (!defined($value)) {
    die "No parameter found!";
}

if ($total_digits == 1) {
    die "Invalid parameter: total digits <= 1.";
}

feasible_primes($total_digits);
solution();

sub solution {    
    print Dumper @feasible_primes;
    # foreach(@primes) {
    # 	if (!is_prime($_)) {
    # 	    die $_;
    # 	}
    # }
    my $max_bin = 2 ** ($total_digits) - 2;

    my $min_dec = 10 ** ($total_digits - 1);

    foreach my $mask_dec(1 .. $max_bin) {
	my $min_multiplier = 1;
	if ($mask_dec >= $min_dec) {
	    $min_multiplier = 1;
	}

	my $mask_bin = sprintf("%b", $mask_dec);

	foreach my $multiplier($min_multiplier .. 9) {
	    get_total_primes_mask($mask_bin * $multiplier);
	}
    }
}

sub get_total_primes_mask {
    my $mask = shift;    

    while(length($mask) < $total_digits) {
	$mask = "0" . $mask;
    }
    
    my %total_by_complement = {};
    my %min_by_complement = {};

    foreach(@feasible_primes) {
	my ($prime_with_mask, $complement) = apply_mask($_, $mask);

	if (is_prime($prime_with_mask)) {
	    $total_by_complement{$complement}++;

	}
    }

    return ($min, $total);
}

sub apply_mask {
    my $n = shift;
    my $mask = shift;

    my $result = "";
    my $complement = "";
    foreach(0 .. $total_digits - 1) {
	my $mask_digit = substr($mask, $_, 1);

	if ($mask_digit != 0) {
	    $result = $result . $mask_digit;
	    $complement = $complement . "0";
	} else {
	    $result = $result . substr($n, $_, 1);
	    $complement .= $substr($n, $_, 1);
	}
    }

#    printf("%d %d %d\n", $n, $mask, $result);

    return (int($result), $complement);
}

sub feasible_primes {
    my $n = shift;

    my $min = 10 ** ($n - 1);
    my $max = (10 ** ($n)) - 1;

    my @sieve = ();

    foreach(0 .. $max) {
	$sieve[$_] = 0;
    }

    @feasible_primes = ();
    @primes = ();
    push @primes, 2;
    for(my $i = 3; $i <= $max; $i += 2) {
	if ($sieve[$i] == 0) {
	    push @primes, $i;

	    if ($min <= $i && $i <= $max) {
		push @feasible_primes, $i;
	    }

	    for(my $j = $i + $i; $j <= $max; $j = $j + $i) {
		$sieve[$j] = 1;
	    }
	}
    }
}

sub is_prime {
    my $x = shift;

    if ($x > 3 && ($x - 1) % 6 != 0 && ($x + 1) % 6 != 0) {
	return 0;
    }

    my $idx = prime_binary_search($x);

    return ($idx >= 0);
}

sub prime_binary_search {
    my $x = shift;
    return prime_binary_search_r ($x, 0, scalar(@primes) - 1);
}

sub prime_binary_search_r {
    my ($x, $l, $r) = @_;

    if ($l > $r) {
	return -1;
    }

    my $m = int (($l + $r) / 2);

    if ($x == $primes[$m]) {
	return $m;
    } else {
	if ($x < $primes[$m]) {
	    return prime_binary_search_r($x, $l, $m-1);
	} else {
	    return prime_binary_search_r($x, $m+1, $r);
	}
    }
}
