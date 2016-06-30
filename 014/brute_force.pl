#/usr/bin/perl

use strict;
use integer;

my $longest = 0;
my $terms = 0;
my $i;
my $j;

for (my $i = 1; $i <= 1000000; $i++) {
    $j = $i;
    my $this_terms = 1;

    while ($j != 1) {
	$this_terms++;

	if ($this_terms > $terms) {
	    $terms = $this_terms;
	    $longest = $i;
	}

	if ($j % 2 == 0) {
	    $j = $j / 2;
	} else {
	    $j = 3 * $j + 1;
	}
    }
}

printf("longest: %d (%d)\n", $longest, $terms);
