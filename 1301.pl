#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

use XML::LibXML;

my $filename = 'U381505d3063bfe86517xx.xml';

my $dom = XML::LibXML->load_xml(location => $filename);

my @stack = (); # empty array


foreach my $title ($dom->findnodes('/TranslationTask/TranslationData/TranslationSrcInfo/UserDefAttribute')) {
    # print "$title->{value}\n";
    push(@stack,$title->{value}) ;
    
}
my @spl = split(';', $stack[2]);

print "\n Part No  = $stack[0]\n";
print "\n Rev = $spl[0]\n";
print "\n Seq = $spl[1]\n";


perl soap.pl $stack[0] $spl[0] $spl[1]



------------------------------------------------------------------------------

use XML::LibXML;
# create a new parser object
my $parser = XML::LibXML->new();

# parse the XML file
my $doc = $parser->parse_file("U381505d3063bfe86517xx.xml");

# create an XPath object
my $xpath = XML::LibXML::XPathContext->new($doc);

# get the node of the element
my ($node) = $xpath->findnodes('//UserDefAttribute');

# get the value of the attribute
my $value = $node->getAttribute('value');

# print the value
print "$value \n";

------------------------------------------
#!/usr/bin/perl -w
  
# Original Array
@array = ( 10, 20, 30 );
  
# Printing Array elements
print "Original Array: @array \n";
  
# Calling push function to 
# add a list of elements
push(@array, (35, 40, 55));
  
# Printing Updated array elements
print "Updated Array: @array \n";

----------------------------------------------

# Perl program to demonstrate the splitting on character
  
#!/usr/bin/perl
use strict;
use warnings;
  
# Here character is comma(, )
my $str = 'Geeks, for, Geeks';
  
# using split() function
my @spl = split(', ', $str);
  
# displaying result using foreach loop
foreach my $i (@spl) 
{
    print "$i";
}