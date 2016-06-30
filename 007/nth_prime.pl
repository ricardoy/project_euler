use strict;

my $limit = get_limit();
my @a = ();
foreach(0 .. $limit) {
	$a[$_] = 0;
}

my $n = 1;
for(my $i = 3; $i <= $limit; $i+=2) {
	if ($a[$i] == 0) { #new prime found
		$n++;
		
		if($n == 10001) {
			print $i, "\n";
			exit;
		} else {
			for(my $j = $i; $j <= $limit; $j = $j + $i) {
				$a[$j] = 1;
			}
		}
	}
}
die;
sub get_limit {
	for (my $i = 10; ; $i++) {
		if (tot_prime_below($i) > 10001) {		
			return $i;		}
	}	
}
sub tot_prime_below {
	my $x = shift;
	
	return $x / log($x);}