leds = [0 => [' _  ','| | ','|_| '],
        1 => ['  ','| ','| '],
        2 => [' _  ',' _| ','|_  '],
        3 => ['_  ','_| ','_| '],
        4 => ['    ','|_| ','  | '],
        5 => [' _  ','|_  ',' _| '],
        6 => [' _  ','|_  ','|_| '],
        7 => ['_   ',' |  ',' |  '],
        8 => [' _  ','|_| ','|_| '],
        9 => [' _  ','|_| ',' _| ']]
		
print 'Enter a number: '
number = gets.chomp
for i in 0...3
	for j in 0...number.length
		print leds[0][Integer(number[j])][i]
	end
print "\n"
end
