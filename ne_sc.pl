#! bin/usr/perl
use strict;
use warnings;
open (my $ins, '<', "instruction.txt");
while(<$ins>){
	print $_;
}
chomp (my $input =<>);
if($input =~ /<INPUT>/){
	print "matrix";
	
}
elsif($input =~ m/<READ>\s*(\w+.txt)/){
	#print $1."\n";
	open (my $r, '<', $1);
	while (<$r>){
		print $_;
	}
}