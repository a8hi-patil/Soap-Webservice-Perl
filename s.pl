use strict;
use warnings;
use Mojo::UserAgent;
my $ua = Mojo::UserAgent->new;

my $hash;
$hash->{variable} = "SomeText";

my $SOAP_request = <<"END_MESSAGE";
<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:get_recall_attributes">
   <soapenv:Header/>
   <soapenv:Body>
      <urn:GetRecallAttributes soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
         <Item xsi:type="xsd:string">544247510001</Item>
         <Rev xsi:type="xsd:string">A</Rev>
         <Seq xsi:type="xsd:string">6</Seq>
      </urn:GetRecallAttributes>
   </soapenv:Body>
</soapenv:Envelope>
END_MESSAGE

$ua->post('http://172.22.97.12:9080/get_recall_attributes.wsdl' => $SOAP_request => sub { 
   my ($c, $tx) = @_; 
   print $tx->res->body;              
});