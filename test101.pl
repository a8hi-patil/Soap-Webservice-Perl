use warnings;
use strict;
use 5.010;
use XML::LibXML;
use LWP::UserAgent;
use HTTP::Request::Common;
use PDF::Report;
use Encode qw(encode);

#Declaring base directory
my $baseDir = 'Z:\Stage\DC';
print "\n  base dir path = $baseDir";
# taking commad line argument for full path of pdf

my $pdfPath = "Z:\Stage\DC\U38150113163c0e59f3c1x\result\546529103801.pdf"

# splitting the path 
my @spl = split /\\/, $pdfPath;
# Storing values in diffrent variables
my $taskId = $spl[3];
my $pdfName = $spl[5];
my $xmlfile ="$baseDir\\$spl[3]\\$spl[3].xml";
my $resultDir ="$baseDir\\$spl[3]\\$spl[4]\\";

print "\n  bataskid = $taskId";
print "\n  pdf  = $pdfName";
print "\n  xml = $xmlfile \n";
print "\n  result dir = $resultDir \n";