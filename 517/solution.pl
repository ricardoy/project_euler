#!/usr/bin/perl

use POSIX; # ceil and floor functions
use strict;
use 5.10.0;
use Data::Dumper;
use bignum;
use Memoize;

print g(2, 4), "\n";

memoize('G');
memoize('g');

my @primes = get_primes();

my $sum;
my $c = 0;
foreach(@primes) {
    print STDERR $c++, "\n";
    $sum = ($sum + G($_)) % 1_000_000_007;
}
say $sum;

sub G {
    my $n = shift;

    return g(sqrt($n), $n);
}

sub g {
    my ($a, $x) = @_;

    if ($x < $a) {
	return 1;
    }

    return g($a, $x - 1) + g($a, $x - $a);
}

sub get_primes {
    my @result = ();
    while(<STDIN>) {
	chomp;
	push @result, $_;
    }
}
