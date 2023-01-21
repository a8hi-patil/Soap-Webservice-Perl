use strict;
use LWP::UserAgent;
use HTTP::Request;
my $message = '<?xml version=\"1.0\" encoding=\"utf-8\"?>
               <soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.or
g/soap/envelope/" xmlns:urn="urn:get_recall_attributes">
                    <soapenv:Header/>
                        <soapenv:Body>
                            <urn:GetRecallAttributes soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
                            <Item xsi:type="xsd:string">544247510001</Item>
                            <Rev xsi:type="xsd:string">A</Rev>
                            <Seq xsi:type="xsd:string">6</Seq>
                            </urn:GetRecallAttributes>
                        </soapenv:Body>
                </soapenv:Envelope>';

my $userAgent = LWP::UserAgent->new();
my $request = HTTP::Request->new(POST => 'http://172.22.97.12:9080/cgi/get_recall_attributes.cgi');
# $request->header(SOAPAction => '""'); #use it if required
$request->content($message);
$request->content_type("text/xml; charset=utf-8");
my $response = $userAgent->request($request);
# $response->code == 200
print "Printing\n";
print $response->decoded_content;
print "ending\n";

print "done\n";
my $string1 = $response->decoded_content;
my $string = $string1;
print $string;
# Find the positions of the words "quick" and "over"
my $start_pos = index $string, "PartNo";
my $end_pos = index $string, "</Response>";

# Extract the portion of the string between the words
my $substring = substr $string, $start_pos, $end_pos - $start_pos;

# Print the extracted string
print "Printing-------------------------------------\n";
print $substring;