cat /tmp/p022_names.txt | sed 's/,/\n/g' | sed 's/"//g' | sort | perl -ne 'BEGIN{$c = 1; my $result = 0} $x = 0; foreach(m/(\w)/g){$x += ord($_) - 64} $result += $c * $x; $c++; END{print $result, "\n"} ' 

