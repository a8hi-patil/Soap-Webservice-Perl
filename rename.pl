#!/usr/bin/perl -w

# Calling the rename() function
# with required parameters
rename("x.txt",
	"y.txt") ||
	die ( "Error in renaming" );
