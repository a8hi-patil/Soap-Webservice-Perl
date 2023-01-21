use XML::Simple;
use Data::Dumper;   


my $file = "U381505d3063bfe86517xx.xml";

	
	my $test_data = XMLin($file);

    # my $final = $test_data->{'SOAP-ENV:Body'}->{'ns:GetRecallAttributesResponse'}->{'Response'};
	my $item = $test_data->{'TranslationData'}->{'TranslationSrcInfo'}->{'UserDefAttribute'}->{'itemid'}->{'value'};
	
	my $revseq = $test_data->{'TranslationData'}->{'TranslationSrcInfo'}->{'UserDefAttribute'}->{'revisionid'}->{'value'};
	my @string = split(";","$revseq");
	my $rev = @string[0];
	my $seq = @string[1];
	my $str = "$item,$rev,$seq";
	
  print $str;


C:\Strawberry\perl\bin\perl.exe