use XML::Simple;

# parse the response
my $xml = new XML::Simple;
my $data = $xml->XMLin($xml_response);

# extract the desired value
my $response = $data->{'SOAP-ENV:Body'}->{'ns:GetRecallAttributesResponse'}->{'Response'};
print $response;
