#!/usr/bin/perl

use strict;

# a² + b² = c²
# a + b + c = 100
# a < b < c
# find a * b * c

for(my $a = 1; $a <= 332; $a++) {
    for(my $b = $a + 1; 1000 - ($a + $b) > $b; $b++) {
	my $c = 1000 - $a - $b;

	if ($c > $b) {
	    if (($a ** 2) + ($b ** 2) == ($c ** 2)) {
		printf("%d %d %d\n", $a, $b, $c);
		print $a * $b * $c, "\n";
	    }
	}
    }
}


print "end\n";
