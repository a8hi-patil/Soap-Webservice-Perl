use warnings;

use strict;

use feature 'say';



my $str = 'Z:\Stage\DC\U38150676f63beccdd12d2\547324100112.prt';
my $str = $ARGV[0];



my @spl = split /\\/, $str;



shift @spl if $spl[4] eq '';



#say for @spl;

say "\n  baseDir = $spl[0]\\$spl[1]\\$spl[2]";

say "\n   taskId = $spl[3]\n";

say "\n  prtName = $spl[4]\n";
