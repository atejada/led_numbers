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

my $num = prompt "Enter a number: ";
my $i = 0, my $j = 0;
my @numbers = $num.comb(/\d/);
for 0 .. 2 -> $i {
    for @numbers -> $j {
        my @line = %leds{$j}.split(',');
        print @line[$i];
    }
    print "\n";
}
