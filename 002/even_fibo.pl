#!/usr/bin/perl

use strict;

my $sum = 0;

my $f1 = 1;
my $f2 = 2;

while($f2 <= 4000000) {

    if ($f2 % 2 == 0) {
	$sum += $f2;
    }

    my $f3 = $f1 + $f2;

    $f1 = $f2;
    $f2 = $f3;    
}
print $sum, "\n";
