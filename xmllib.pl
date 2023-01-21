use XML::LibXML;

# create a new parser object
my $parser = XML::LibXML->new();

# parse the XML file
my $doc = $parser->parse_file("U381505d3063bfe86517xx.xml");

# get the value of the element
my $value = $doc->findvalue('/TranslationSrcInfo');

# print the value
print $value;


use XML::Simple;

# create an XML object
my $xml = new XML::Simple;

# read the XML file
my $data = $xml->XMLin("U381505d3063bfe86517xx.xml");

# print the data
print $data;
----------------------
use XML::LibXML;

# create a new parser object
my $parser = XML::LibXML->new();

# parse the XML file
my $doc = $parser->parse_file("U381505d3063bfe86517xx.xml");

# print the data
print $doc->toString();


-------------------
use XML::LibXML;

# create a new parser object
my $parser = XML::LibXML->new();

# parse the XML file
my $doc = $parser->parse_file("U381505d3063bfe86517xx.xml");

# create an XPath object
my $xpath = XML::LibXML::XPathContext->new($doc);

# get the value of the element
my ($node) = $xpath->findnodes('//UserDefAttribute');

# print the value
print $node->to_literal;

-----------------------------------------
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

-----------------------------------------------------
use XML::LibXML;

# create a new parser object
my $parser = XML::LibXML->new();

# parse the XML file
my $doc = $parser->parse_file("U381505d3063bfe86517xx.xml");

# create an XPath object
my $xpath = XML::LibXML::XPathContext->new($doc);

# get all the nodes of the elements
my @nodes = $xpath->findnodes('//TranslationSrcInfo');

# iterate through the nodes
foreach my $node (@nodes) {
    # get the value of the tag
    my $value = $node->textContent;

    # print the value
    print $value."\n";
}
