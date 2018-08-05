#!/usr/bin/perl
use strict;
use warnings;
use diagnostics;

my %leds = (
	'0' => ' _  ,| | ,|_| ',
	'1' => '  ,| ,| ',
	'2' => ' _  , _| ,|_  ',
	'3' => '_  ,_| ,_| ',
	'4' => '    ,|_| ,  | ',
	'5' => ' _  ,|_  , _| ',
	'6' => ' _  ,|_  ,|_| ',
	'7' => '_   , |  , |  ',
	'8' => ' _  ,|_| ,|_| ',
	'9' => ' _  ,|_| , _| '
);

print "Enter a number: ";
my $num = <>;
my @numbers = ( $num =~ /\d/g );

for my $i (0 .. 2){
	for my $j (0 .. scalar(@numbers) - 1){
		my @line = split /\,/,$leds{$numbers[$j]};
		print $line[$i];
	}
	print "\n";
}
