#!/usr/bin/perl

use POSIX; # ceil and floor functions
use strict;
use 5.10.0;
use Data::Dumper;

my $line = <STDIN>;

my @values_old = process_line($line);

my @result_old = process_line($line);

while($line = <STDIN>) {
    my @values_current = process_line($line);

    my @result_current = ();
    for(my $i = 0; $i <= scalar(@result_old); $i++) {
	if ($i == 0) {
	    $result_current[0] = $values_current[0] + $result_old[0];
	} elsif ($i == scalar(@result_old)) {
	    $result_current[$i] = $values_current[$i] + $result_old[$i-1];
	} else {
	    $result_current[$i] = $values_current[$i] + max($result_old[$i-1], $result_old[$i]);
	}
    }

    @result_old = @result_current;

#    print join(",", @result_current), "\n";
}

say max(@result_old);

sub process_line {
    my $line = shift;

    $line =~ s/\n//;

    return split(/\s+/, $line);
}

sub max {
    my $max = shift;

    foreach(@_) {
	if ($_ > $max) {
	    $max = $_;
	}
    }

    return $max;
}
