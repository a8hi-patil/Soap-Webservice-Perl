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

# Find the positions of the words "quick" and "over"
my $start_pos = index $string, "PartNo";
my $end_pos = index $string, "</Response>";

# Extract the portion of the string between the words
my $substring = substr $string, $start_pos, $end_pos - $start_pos;

# Print the extracted string
print "Printing-------------------------------------\n";
print $substring; 

my $string = "PartNo:544247510001,A,6~Description:FUEL SYSTEM IFD CNG FUEL LINES &amp; CLAMPS~Modification_description:NOTE 6 UPDATED FOR TIGHTENING SEQUENCE. NOTE 9 ADDED.LOCATION DETAI
LS ADDED IN SECTION E-E AND P-P. CYLINDER VALVE KNOB POSITIONS ADDED.TABLE B UPDATED SECTION K-K DESCRIPTION CHANGED.VIEWS ADDED FOR ALTROZ &amp; PUNCH HP LINE.SHEET 3 VIEW
S UPD~Track_Trace:~Critical_to_Emission_Critical_to_Safety:~Drawing_Sheet_Size_and_Sheet_orientation:~";

# Extract the characters at positions 3 to 22
my $substring = substr $string, 7, 16;

# Split the string into an array
my @values = split /,/, $substring;

# Print the extracted values
# print join "\n", @values;
my $partnumber = $values[0];  # "def"
my $rev = $values[1];  # "ghij"
my $seq = $values[2];  # "ghij"

my $newstr = "Part Number :$partnumber Revision:$rev Seq:$seq ";
print $newstr;


PartNo:544247510001,A,6~Description:FUEL SYSTEM IFD CNG FUEL LINES &amp; CLAMPS~Modification_description:NOTE 6 UPDATED FOR TIGHTENING SEQUENCE. NOTE 9 ADDED.LOCATION DETAI
LS ADDED IN SECTION E-E AND P-P. CYLINDER VALVE KNOB POSITIONS ADDED.TABLE B UPDATED SECTION K-K DESCRIPTION CHANGED.VIEWS ADDED FOR ALTROZ &amp; PUNCH HP LINE.SHEET 3 VIEW
S UPD~Track_Trace:~Critical_to_Emission_Critical_to_Safety:~Drawing_Sheet_Size_and_Sheet_orientation:~
