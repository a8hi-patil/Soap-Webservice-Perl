use XML::LibXML;

# create a new parser object
my $parser = XML::LibXML->new();

# parse the XML file
my $doc = $parser->parse_file("U381505d3063bfe86517xx.xml");

# print the data
my $data = $doc->toString();


my $string = $data;
# print $string;
# Find the positions of the words "quick" and "over"
my $start_pos = index $string, "datasetname";
my $end_pos = index $string, "/>";

# Extract the portion of the string between the words
my $substring = substr $string, $start_pos, $end_pos - $start_pos;



