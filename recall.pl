use strict;
use warnings;
use PDF::Report;
use Encode qw(encode);
my $file = "C:\\Strawberry\\perl\\TataLogo.JPEG";
my $file2 = "C:\\Strawberry\\perl\\images.png";



my $InputtxtFile = "attribute.txt";
#need to catch working directory from batch file $ARGV[1];

my $drw_pdf="$resultDir\\$pdfName-ORIG.pdf";

my $finalpdf = "$resultDir\\$pdfName-combine.pdf";
my $OutputPDF = "$resultDir\\$pdfName-template.pdf";
# open (FILE,$InputtxtFile) or die "Couldn't open file $!";
open (FILE,$InputtxtFile) or die "Couldn't open file $!";
my(@linearr) = <FILE>;
close(FILE);
my $PartNo;
my $Description;
my $Mod_Desc;
my $TT;
my $Critical;
my $Sheetsize;
my $Revision;
my $Sequence;
print  "file reading completed";


foreach my $line (@linearr){
	chop $line;
	print "$line\n";
	my ($key, $val) = split ("::", $line);
	print "key value sepearated";
	if ( $val eq "")
	{
		$val="NULL";
	};
	
	
	if ( $key eq "Part Number" )
	{
		$PartNo=$val;
	}
	elsif ($key eq "Description")
	{
		$Description=$val;
	}
	elsif ($key eq "Modification Description")
	{
		$Mod_Desc=$val;
	}
	elsif ($key eq "Track & Trace ")
	{
	    $TT=$val;
	} 
	elsif ($key eq "Critical to Emission Critical to Safety")
	{
		$Critical=$val;
	}
	elsif ($key eq "Drawing Sheet Size and Sheet orientation")
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
# print "$Revision";

# my $PartNo_Rev_Seq = $PartNo.' '.$Revision.','.$Sequence;
my $PartNo_Rev_Seq = $PartNo;
# print "$PartNo_Rev_Seq";
# print $OutputPDF;
				
if( $Sheetsize  eq  'A4'){
        my $PageSize='A4';
        my $PageOrientation="Portrait";
		my $bx1=20;my $bx2=575;my $by2=822;my $by1=$bx1;
		my $img_x=420;my $img_y=780;my $img_scale=0.1; # Logo dimension
		my $img_x2=50;my $img_y2=770;my $img_scale2=0.3; # Logo dimension

		my $size1=10;my $size2=8; 
		my $x1=110; my $x2=255; my $y1=600; my $y2=620;
		my $x22=485;
		my $w=$y2-$y1; # height of cell
		my $p1=7; # padding
		my $m1=13.3;
		my $h1=40;      my $h2=90;
		my $wrap=230; my $wrap_p=3.2; my $wrap_m=4; 
		my $loc_x1=220; my $loc_x2=430; my $loc_y=8; 
        Create_PDF($PageSize,$PageOrientation,$x1,$x2,$y1,$y2,$x22,$w,$p1,$m1,$h1,$h2,$size1,$size2,$bx1,$bx2,$by2,$img_x,$img_y,$img_scale,$img_x2,$img_y2,$img_scale2,$wrap,$wrap_p,$wrap_m,$loc_x1,$loc_x2,$loc_y);

}elsif( $Sheetsize  eq  'A0' ) {

        my $PageSize='A0';
        my $PageOrientation="Landscape";
        my $x1=900; my $x2=1400; my $y1=1600; my $y2=1670;
		my $x22=2300;
		my $w=$y2-$y1; # height of cell
		my $p1=30; # padding
		my $m1=45;
		my $h1=110;     my $h2=350;
		my $size1=34;my $size2=28;
		my $bx1=50;my $bx2=3310;my $by2=2320;
		my $img_x=2820;my $img_y=2180;my $img_scale=0.3;
		my $img_x2=150;my $img_y2=2160;my $img_scale2=1;
		my $wrap=830; my $wrap_p=0.09; my $wrap_m=11; 
		my $loc_x1=1350; my $loc_x2=2800; my $loc_y=20;
        Create_PDF($PageSize,$PageOrientation,$x1,$x2,$y1,$y2,$x22,$w,$p1,$m1,$h1,$h2,$size1,$size2,$bx1,$bx2,$by2,$img_x,$img_y,$img_scale,$img_x2,$img_y2,$img_scale2,$wrap,$wrap_p,$wrap_m,$loc_x1,$loc_x2,$loc_y);

}
elsif( $Sheetsize eq  'A1' ) {
        my $PageSize='A1';
        my $PageOrientation="Landscape";
		my $x1=650; my $x2=1070; my $y1=1100; my $y2=1160;
		my $x22=1700;
		my $w=$y2-$y1; # height of cell
		my $p1=20; # padding
		my $m1=35;
		my $h1=90;my $h2=250;
		my $size1=26;my $size2=22;
		my $bx1=35;my $bx2=2340;my $by2=1634;my $by1=$bx1;
		my $img_x=2000;my $img_y=1530;my $img_scale=0.23;
		my $img_x2=100;my $img_y2=1515;my $img_scale2=0.7;
		my $wrap=600; my $wrap_p=0.5; my $wrap_m=8; 
		my $loc_x1=950; my $loc_x2=1930; my $loc_y=15;
        Create_PDF($PageSize,$PageOrientation,$x1,$x2,$y1,$y2,$x22,$w,$p1,$m1,$h1,$h2,$size1,$size2,$bx1,$bx2,$by2,$img_x,$img_y,$img_scale,$img_x2,$img_y2,$img_scale2,$wrap,$wrap_p,$wrap_m,$loc_x1,$loc_x2,$loc_y);

}
elsif( $Sheetsize eq  'A2' ) {
    my $PageSize='A2';
        my $PageOrientation="Landscape";
        my $x1=440; my $x2=760; my $y1=760; my $y2=800;
		my $x22=1220;
		my $w=$y2-$y1; # height of cell
		my $p1=15; # padding
		my $m1=27;
		my $h1=80;my $h2=170;
		my $size1=24;my $size2=18;
		my $bx1=35;my $bx2=1645;my $by2=1140;
		my $img_x=1330;my $img_y=1070;my $img_scale=0.2;
		my $img_x2=100;my $img_y2=1050;my $img_scale2=0.55;
		my $wrap=400; my $wrap_p=1.25; my $wrap_m=10;
		my $loc_x1=670; my $loc_x2=1340; my $loc_y=10; 
        Create_PDF($PageSize,$PageOrientation,$x1,$x2,$y1,$y2,$x22,$w,$p1,$m1,$h1,$h2,$size1,$size2,$bx1,$bx2,$by2,$img_x,$img_y,$img_scale,$img_x2,$img_y2,$img_scale2,$wrap,$wrap_p,$wrap_m,$loc_x1,$loc_x2,$loc_y);
}
elsif( $Sheetsize eq  'A3' ) {
        my $PageSize='A3';
        my $PageOrientation="Landscape";
		my $bx1=35;my $bx2=1150;my $by2=802;
		my $img_x=950;my $img_y=750;my $img_scale=0.13; # Logo dimension
		my $img_x2=60;my $img_y2=740;my $img_scale2=0.35; # Logo dimension
		my $x1=350; my $x2=530; my $y1=550; my $y2=574;
		my $x22=850;
		my $w=$y2-$y1; # height of cell
		my $p1=6; # padding
		my $m1=16;
		my $h1=50;my $h2=120;
		my $size1=12;my $size2=10;
		my $wrap=300; my $wrap_p=4; my $wrap_m=6; 
		my $loc_x1=500; my $loc_x2=970; my $loc_y=15;
        Create_PDF($PageSize,$PageOrientation,$x1,$x2,$y1,$y2,$x22,$w,$p1,$m1,$h1,$h2,$size1,$size2,$bx1,$bx2,$by2,$img_x,$img_y,$img_scale,$img_x2,$img_y2,$img_scale2,$wrap,$wrap_p,$wrap_m,$loc_x1,$loc_x2,$loc_y);

}
elsif( $Sheetsize eq  'R0' ) {
		my $PageSize='2A';
        my $PageOrientation="Landscape";
		my $x1=1550; my $x2=2200; my $y1=2200; my $y2=2280;
		my $x22=3200;
		my $w=$y2-$y1; # height of cell
		my $p1=30; # padding
		my $m1=55;
		my $h1=150;my $h2=400;
		my $size1=50;
		my $size2=34;
		my $bx1=100;my $bx2=4620;my $by2=3220;
		my $by1=$bx1;
		my $img_x=3800;my $img_y=3000;my $img_scale=0.5;
		my $img_x2=200;my $img_y2=2950;my $img_scale2=1.2;
		
		my $wrap=1000; my $wrap_p=0.09; my $wrap_m=17; 
		my $loc_x1=2080; my $loc_x2=3950; my $loc_y=30; 
        Create_PDF($PageSize,$PageOrientation,$x1,$x2,$y1,$y2,$x22,$w,$p1,$m1,$h1,$h2,$size1,$size2,$bx1,$bx2,$by2,$img_x,$img_y,$img_scale,$img_x2,$img_y2,$img_scale2,$wrap,$wrap_p,$wrap_m,$loc_x1,$loc_x2,$loc_y);
}
else {
		# printf "Sheet Size doesnt in A0-A4 Range which is \n";
		my $PageSize='A4';
        my $PageOrientation="Portrait";
		my $bx1=20;my $bx2=575;my $by2=822;my $by1=$bx1;
		my $img_x=420;my $img_y=780;my $img_scale=0.1; # Logo dimension
		my $img_x2=50;my $img_y2=770;my $img_scale2=0.3; # Logo dimension

		my $size1=10;my $size2=8; 
		my $x1=110; my $x2=255; my $y1=600; my $y2=620;
		my $x22=485;
		my $w=$y2-$y1; # height of cell
		my $p1=7; # padding
		my $m1=13.3;
		my $h1=40;      my $h2=90;
		my $wrap=230; my $wrap_p=3.2; my $wrap_m=4; 
		my $loc_x1=220; my $loc_x2=430; my $loc_y=8; 
        Create_PDF($PageSize,$PageOrientation,$x1,$x2,$y1,$y2,$x22,$w,$p1,$m1,$h1,$h2,$size1,$size2,$bx1,$bx2,$by2,$img_x,$img_y,$img_scale,$img_x2,$img_y2,$img_scale2,$wrap,$wrap_p,$wrap_m,$loc_x1,$loc_x2,$loc_y);
}


sub Create_PDF {
        my @list =@_;
        # print "Given list is @list\n";
        my $PageSize=$list[0];
        # print($PageSize);
        my $PageOrientation=$list[1];
        my $x1=$list[2]; my $x2=$list[3]; my $y1=$list[4]; my $y2=$list[5];
        my $x22=$list[6];
        my $w=$list[7]; # height of cell
        my $p1=$list[8]; # padding
        my $m1=$list[9];
        my $h1=$list[10];my $h2=$list[11];
        my $size1=$list[12];my $size2=$list[13];
        my $bx1=$list[14];my $bx2=$list[15];my $by1=$bx1;my $by2=$list[16];
        my $img_x=$list[17];my $img_y=$list[18];my $img_scale=$list[19];
        my $img_x2=$list[20];my $img_y2=$list[21];my $img_scale2=$list[22];
		my $wrap=$list[23]; my $wrap_p=$list[24]; my $wrap_m=$list[25];
		my $loc_x1=$list[26]; my $loc_x2=$list[27]; my $loc_y=$list[28];
        my $pdf = new PDF::Report(PageSize => $PageSize,PageOrientation => $PageOrientation);
        $pdf->newpage(1);
        my $page = $pdf->openpage(1);
        $pdf->drawLine($bx1, $by1, $bx2, $by1);
        $pdf->drawLine($bx1, $by1, $bx1, $by2);
        $pdf->drawLine($bx1, $by2, $bx2, $by2);
        $pdf->drawLine($bx2, $by2, $bx2, $by1);
        $pdf->addImgScaled($file, $img_x, $img_y, $img_scale);
        $pdf->addImgScaled($file2, $img_x2, $img_y2, $img_scale2);
        $pdf->setSize($size1);
        my $color = 'blue';
		$pdf->shadeRect($x1, $y1, $x2, $y2, "#2E75B6");
		$pdf->drawRect($x1, $y1, $x2, $y2,);
		$pdf->addRawText("PARAMETER", $x1 + $h1, $y2-$m1, "white");

		$pdf->shadeRect($x2, $y1, $x22, $y2, "#2E75B6");
		$pdf->drawRect($x2, $y1, $x22, $y2);
		$pdf->addRawText("VALUE", $x2 + $h2, $y2-$m1, "white");
		
        $color = 'black';
        $pdf->setSize($size2);
        $pdf->drawRect($x1, $y1-($w), $x2, $y1);
        $pdf->addRawText("Part Number", $x1 + $p1, $y1-$m1, $color);
        $pdf->drawRect($x2, $y1-($w), $x22, $y1);
        $pdf->addRawText($PartNo_Rev_Seq, $x2 + $p1 , $y1-$m1, $color);
		# $pdf->addRawText(($PartNo,$Revision,$Sequence), $x2 + $p1 , $y1-$m1, $color);
        $pdf->drawRect($x1, $y1-(2*$w), $x2, $y1-($w));
        $pdf->addRawText("Description", $x1 + $p1, $y1-$m1-$w, $color);
        $pdf->drawRect($x2, $y1-(2*$w), $x22, $y1-($w));
        $pdf->addRawText($Description, $x2 + $p1 , $y1-$m1-$w, $color);
		my $height1="";
		my $height2="";
		print($pdf->getStringWidth($Mod_Desc));
		if($pdf->getStringWidth($Mod_Desc) < $wrap){
				$pdf->drawRect($x1, $y1-(3*$w), $x2,$y1-(2*$w));
				$pdf->addRawText("Modification Description", $x1 + $p1, $y1-$m1-(2*$w), $color);
				$pdf->drawRect($x2, $y1-(3*$w), $x22, $y1-(2*$w));
				$pdf->addRawText($Mod_Desc,$x2 + $p1,$y1-$m1-(2*$w),$color );
				$height1 = 4;
				$height2 = 3;
		}
		elsif($pdf->getStringWidth($Mod_Desc) < (2*$wrap)){
			$pdf->drawRect($x1, $y1-(3*$w) , $x2,$y1-(2*$w));
			$pdf->addRawText("Modification Description", $x1 + $p1, $y1-$m1-(2*$w), $color);
			$pdf->drawRect($x2, $y1-(3*$w), $x22, $y1-(2*$w));
			my $newtext = $pdf->wrapText($Mod_Desc, $wrap);
			$pdf->setAddTextPos($x2 - ($wrap_p*$p1) , $y1-$m1-(2*$w)+$wrap_m);
			$pdf->addText($newtext, $x2 - ($wrap_p*$p1),300, 50); #xcoordinat ,
			$height1 = 4;
			$height2 = 3;
		}	
		elsif($pdf->getStringWidth($Mod_Desc) < (2.9*$wrap)){
			$pdf->drawRect($x1, $y1-(3.5*$w) , $x2,$y1-(2*$w));
			$pdf->addRawText("Modification Description", $x1 + $p1, $y1-$m1-(2.25*$w), $color);
			$pdf->drawRect($x2, $y1-(3.5*$w), $x22, $y1-(2*$w));
			my $newtext = $pdf->wrapText($Mod_Desc, $wrap);
			$pdf->setAddTextPos($x2 - ($wrap_p*$p1) , $y1-$m1-(2*$w)+$wrap_m);
			$pdf->addText($newtext, $x2 - ($wrap_p*$p1),300, 50); #xcoordinat ,
			$height1 = 4.5;
			$height2 = 3.5;
		}elsif($pdf->getStringWidth($Mod_Desc) < (3.85*$wrap)){
			$pdf->drawRect($x1, $y1-(4*$w) , $x2,$y1-(2*$w));
			$pdf->addRawText("Modification Description", $x1 + $p1, $y1-$m1-(2.5*$w), $color);
			$pdf->drawRect($x2, $y1-(4*$w), $x22, $y1-(2*$w));
			my $newtext = $pdf->wrapText($Mod_Desc, $wrap);
			$pdf->setAddTextPos($x2 - ($wrap_p*$p1) , $y1-$m1-(2*$w)+$wrap_m);
			$pdf->addText($newtext, $x2 - ($wrap_p*$p1),300, 50); #xcoordinat ,
			$height1 = 5;
			$height2 = 4;
		}elsif($pdf->getStringWidth($Mod_Desc) < (4.8*$wrap)){
			$pdf->drawRect($x1, $y1-(4.5*$w) , $x2,$y1-(2*$w));
			$pdf->addRawText("Modification Description", $x1 + $p1, $y1-$m1-(2.75*$w), $color);
			$pdf->drawRect($x2, $y1-(4.5*$w), $x22, $y1-(2*$w));
			my $newtext = $pdf->wrapText($Mod_Desc, $wrap);
			$pdf->setAddTextPos($x2 - ($wrap_p*$p1) , $y1-$m1-(2*$w)+$wrap_m);
			$pdf->addText($newtext, $x2 - ($wrap_p*$p1),300, 50); #xcoordinat ,
			$height1 = 5.5;
			$height2 = 4.5;
		}elsif($pdf->getStringWidth($Mod_Desc) < (5.7*$wrap)){
			$pdf->drawRect($x1, $y1-(5*$w) , $x2,$y1-(2*$w));
			$pdf->addRawText("Modification Description", $x1 + $p1, $y1-$m1-(3*$w), $color);
			$pdf->drawRect($x2, $y1-(5*$w), $x22, $y1-(2*$w));
			my $newtext = $pdf->wrapText($Mod_Desc, $wrap);
			$pdf->setAddTextPos($x2 - ($wrap_p*$p1) , $y1-$m1-(2*$w)+$wrap_m);
			$pdf->addText($newtext, $x2 - ($wrap_p*$p1),300, 50); #xcoordinat ,
			$height1 = 6;
			$height2 = 5;
		}elsif($pdf->getStringWidth($Mod_Desc) < (6.7*$wrap)){
			$pdf->drawRect($x1, $y1-(5.5*$w) , $x2,$y1-(2*$w));
			$pdf->addRawText("Modification Description", $x1 + $p1, $y1-$m1-(3.25*$w), $color);
			$pdf->drawRect($x2, $y1-(5.5*$w), $x22, $y1-(2*$w));
			my $newtext = $pdf->wrapText($Mod_Desc, $wrap);
			$pdf->setAddTextPos($x2 - ($wrap_p*$p1) , $y1-$m1-(2*$w)+$wrap_m);
			$pdf->addText($newtext, $x2 - ($wrap_p*$p1),300, 50); #xcoordinat ,
			$height1 = 6.5;
			$height2 = 5.5;
		}else{
			$pdf->drawRect($x1, $y1-(6*$w) , $x2,$y1-(2*$w));
			$pdf->addRawText("Modification Description", $x1 + $p1, $y1-$m1-(3.5*$w), $color);
			$pdf->drawRect($x2, $y1-(6*$w), $x22, $y1-(2*$w));
			my $newtext = $pdf->wrapText($Mod_Desc, $wrap);
			$pdf->setAddTextPos($x2 - ($wrap_p*$p1) , $y1-$m1-(2*$w)+$wrap_m);
			$pdf->addText($newtext, $x2 - ($wrap_p*$p1),300, 50); #xcoordinat ,
			$height1 = 7;
			$height2 = 6;
		}
        $pdf->drawRect($x1, $y1-($height1*$w), $x2,$y1-($height2*$w));
        $pdf->addRawText("Track & Trace", $x1 + $p1, $y1-$m1-($height2*$w), $color);
        $pdf->drawRect($x2, $y1-($height1*$w), $x22,$y1-($height2*$w));
        $pdf->addRawText($TT, $x2 + $p1 , $y1-$m1-($height2*$w), $color);
		
        $pdf->drawRect($x1, $y1-(($height1+1)*$w), $x2, $y1-(($height2+1)*$w));
		$pdf->addRawText("Critical to Emission / Critical to Safety", $x1 + $p1, $y1-$m1-(($height2+1)*$w), $color);
        $pdf->drawRect($x2, $y1-(($height1+1)*$w), $x22, $y1-(($height2+1)*$w));
        $pdf->addRawText($Critical, $x2 + $p1 , $y1-$m1-(($height2+1)*$w), $color);
		



		$pdf->setSize($size1);
		my $enc = 'ISO-8859-1';
		my $chars = chr(169).' Copyright Tata Motors Limited';
		my $octets = encode($enc, $chars, Encode::FB_CROAK);
		# print $octets;
		# my $Copyright="© Copyright Tata Motors Limited";
		$pdf->addRawText($octets, $loc_x1 ,$loc_y, $color);
		$pdf->setSize($size2);
		$pdf->addRawText(" Format No. PA20-F126 (R0), Jan 2022", $loc_x2  , $loc_y, $color);
        my ($pagewidth, $pageheight) = $pdf->getPageDimensions();
        # print($pagewidth, $pageheight);
        $pdf->saveAs($OutputPDF);
}
print "templatefile created ";

# files to merge
my @input_files = (
    $OutputPDF,$drw_pdf
);
my $output_file = $finalpdf;

# the output file
my $output_pdf = PDF::API2->new(-file => $output_file);

foreach my $input_file (@input_files) {
    my $input_pdf = PDF::API2->open($input_file);
    my @numpages = (1..$input_pdf->pages());
    foreach my $numpage (@numpages) {
        # add page number $numpage from $input_file to the end of 
        # the file $output_file
        $output_pdf->importpage($input_pdf,$numpage,0);        
    };
};

$output_pdf->save();
