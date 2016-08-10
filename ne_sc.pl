#! bin/usr/perl
use strict;
use warnings;
open (my $ins, '<', "instruction.txt");
while(<$ins>){
	print $_;
}
chomp (my $input =<>);
if($input =~ /<INPUT>/){
	print "matrix\n";
	$input = <>;
	my $count = () = $input =~ /\(*\)/g;
	print $count."\n"; #matrix size
	#create matrix and store first line value
	for( my $i = 1; $i < $count; $i++){
		# the next n-1 lines
	}
}
elsif($input =~ m/<READ>\s*(\w+.txt)/){
	#print $1."\n";
	open (my $r, '<', $1);
	while (<$r>){
		print $_;
	}
}