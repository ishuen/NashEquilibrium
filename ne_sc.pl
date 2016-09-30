#! bin/usr/perl
use strict;
use warnings;
open (my $ins, '<', "instruction.txt");
while(<$ins>){
	print $_;
}
chomp (my $input =<>);
my (@temp, $count);
if($input =~ /<INPUT>/){
	$input = <>;
	@temp = $input =~ /(-?\d+)/g;
	$count = @temp/2;
	for( my $i = 1; $i < $count; $i++){
		# the next n-1 lines
		$input = <>;
		my @temp2 = $input =~ /(-?\d+)/g;
		push @temp, @temp2;
	}
}
elsif($input =~ m/<READ>\s*(\w+.txt)/){
	open (my $r, '<', $1);
	$input = <$r>;
	@temp = $input =~ /(-?\d+)/g;
	$count = @temp/2;
	while (<$r>){
		my @temp2 = /(-?\d+)/g;
		push @temp, @temp2;
	}
}
my (@a, @b, @aind, @bind);
for(my $i=0; $i < $count; $i++){
	$b[$i] = $temp[$count*2*$i+1];
	$a[$i] = $temp[2*$i];
	$bind[$i] = $count*2*$i+1;
	$aind[$i] = 2*$i;
	for(my $j=1; $j < $count; $j++){
		if($temp[$count*2*$i+2*$j+1]>$b[$i]){
			$b[$i] = $temp[$count*2*$i+2*$j+1];
			$bind[$i] = $count*2*$i+2*$j+1;
		}
		if($temp[2*$i+$count*2*$j]>$a[$i]){
			$a[$i] = $temp[2*$i+$count*2*$j];
			$aind[$i] = 2*$i+$count*2*$j;
		}
	}
}
my @aind2 = sort { $a <=> $b } @aind;
my $t = shift @bind;
my $ans = 0;
for(my $i=0; $i < $count; $i++){
	if(defined $t){
		if($aind2[$i] > $t){
			$i--;
		}
		elsif($aind2[$i]+1 == $t){
			print "($temp[$aind2[$i]],$temp[$t])\n";
			$ans++;
		}
		$t = shift @bind;
	}
}
if($ans == 0){
	print "There is no Pure Strategy Nash Equilibrium. You have to check the condition and change the model, for example, Mixed Strategy Nash Equilibrium";
}
elsif($ans == 1){
	print "There are $ans point meets Nash Equilibrium.";
}
else{
	print "There are $ans points meet Nash Equilibrium.";
}
