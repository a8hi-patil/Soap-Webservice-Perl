
# Perl program to demonstrate the 
# splitting on string with Limit
  
#!/usr/bin/perl
use strict;
use warnings;
  
# string which is separated by !! sign
my $str = 'GFG!!Geeks!!55!!GeeksforGeeks';
  
# using split function with Limit
my @spl = split('!!', $str, 3);
  
# displaying string after splitting
foreach my $i (@spl) 
{
    print "$i\n";
}