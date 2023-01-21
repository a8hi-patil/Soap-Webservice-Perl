use LWP::UserAgent;
use HTTP::Request::Common;

my $ua = LWP::UserAgent->new;

$prt = $ARGV[0];
$rev = $ARGV[1];
$seq = $ARGV[2];
print "PART NAME IS == $prt REV == $rev sequence is = $seq  \n" ;


# my $prt ="544247510001";
# my $rev ="A";
# my $seq ="6";

# my $prt ="544247510001";
# my $rev ="A";
# my $seq ="6";


# Build the SOAP request
my $soap_request = <<"SOAP_REQUEST";
<?xml version=\"1.0\" encoding=\"utf-8\"?>
               <soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:get_recall_attributes">
                    <soapenv:Header/>
                        <soapenv:Body>
                            <urn:GetRecallAttributes soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
                            <Item xsi:type="xsd:string">$prt</Item>
                            <Rev xsi:type="xsd:string">$rev</Rev>
                            <Seq xsi:type="xsd:string">$seq</Seq>
                            </urn:GetRecallAttributes>
                        </soapenv:Body>
                </soapenv:Envelope>
SOAP_REQUEST

# Send the request
my $response = $ua->request(POST 'http://172.22.97.12:9080/cgi/get_recall_attributes.cgi',
  Content_Type => 'text/xml',
#   SOAPAction => 'http://example.com/myAction',
  Content => $soap_request
);

# Check the response
if ($response->is_success) {
    # print $response->decoded_content;  # or whatever
    my $string1 = $response->decoded_content;
    my $string = $string1;
    # print $string;
    # Find the positions of the words "quick" and "over"
    my $start_pos = index $string, "PartNo";
    my $end_pos = index $string, "</Response>";

    # Extract the portion of the string between the words
    my $substring = substr $string, $start_pos, $end_pos - $start_pos;

    # Print the extracted string
    print "Printing-------------------------------------\n";
    print $substring;

    open my $fh, '>', "$prt-$rev-$seq.txt" or die "Could not open file: $!";

    # Write the string to the file
    print $fh $substring;

    # Close the file
    close $fh;
    print "done\n";

}
    
else {
    die $response->status_line;
}
