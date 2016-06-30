#!/usr/bin/perl

use POSIX; # ceil and floor functions
use strict;
use 5.10.0;
use Data::Dumper;
use bignum;
use Memoize;

my $a = shift;
my $n = shift;

my %c= ();

g($a, $n);

my $total = 0;
foreach(sort {$a <=> $b} keys(%c)) {
    printf("%d\t%d\n", $_, $c{$_});
    $total += $c{$_};
}

print $total;

sub g {
    my ($a, $x) = @_;
    $c{$x}++;

    if ($x < $a) {
	return 1;
    }

    return g($a, $x - 1) + g($a, $x - $a);
}

