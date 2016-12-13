#!/usr/bin/perl

use strict;

my $max = -1;
for(my $x = 999; $x > 100; $x--) {
    for(my $y = 999; $y > 100; $y--) {
	my $p = $x * $y;

	if (palindrome($p)) {
	    if ($p > $max) {
		$max = $p;
	    }
	}
    }
}
print $max, "\n";

sub palindrome {
    my $x = shift;

    my $l = length($x);

    foreach my $left(0 .. int($l / 2)) {
	my $right = $l - 1 - $left;
	if (substr($x, $left, 1) ne substr($x, $right, 1)) {
	    return 0;
	}
    }
    return 1;
}
