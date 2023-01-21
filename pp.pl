use strict;
use warnings;
use PDF::Report;
use Encode qw(encode);




my $InputtxtFile = "attribute.txt";
#need to catch working directory from batch file $ARGV[1];


# open (FILE,$InputtxtFile) or die "Couldn't open file $!";
open (FILE,$InputtxtFile) or die "Couldn't open file $!";
my (@linearr) = <FILE>;
my @spl = split '~', $linearr[0];
print @spl;
close(FILE);
my $PartNo;
my $Description;
my $Mod_Desc;
my $TT;
my $Critical;
my $Sheetsize;
my $Revision;
my $Sequence;
print  "file reading completed\n";


foreach my $line (@spl){
	# chop $line;
	print "$line arr \n";
	my ($key, $val) = split (":", $line);
	print "key value sepearated\n";
	if ( $val eq "")
	{
		$val="NULL";
	};
	
	
	if ( $key eq "PartNo" )
	{
		$PartNo=$val;
	}
	elsif ($key eq "Description")
	{
		$Description=$val;
	}
	elsif ($key eq "Modification_description")
	{
		$Mod_Desc=$val;
	}
	elsif ($key eq "Track_Trace")
	{
	    $TT=$val;
	} 
	elsif ($key eq "Critical_to_Emission_Critical_to_Safety")
	{
		$Critical=$val;
	}
	elsif ($key eq "Drawing_Sheet_Size_and_Sheet_orientation")
	{
		$Sheetsize=$val;
	}
	
};	

print "$PartNo\n";
print "$Description\n";
print "$Mod_Desc\n";
print "$TT\n";
print "$Critical\n";
print "$Sheetsize\n";