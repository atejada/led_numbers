led.0 = '';led.0.1 = ' _  ';led.0.2 = '| | ';led.0.3 = '|_| '
led.1 = '';led.1.1 = '    ';led.1.2 = '|   ';led.1.3 = '|   '
led.2 = '';led.2.1 = ' _  ';led.2.2 = ' _| ';led.2.3 = '|_  '
led.3 = '';led.3.1 = ' _  ';led.3.2 = ' _| ';led.3.3 = ' _| '
led.4 = '';led.4.1 = '    ';led.4.2 = '|_| ';led.4.3 = '  | '
led.5 = '';led.5.1 = ' _  ';led.5.2 = '|_  ';led.5.3 = ' _| '
led.6 = '';led.6.1 = ' _  ';led.6.2 = '|_  ';led.6.3 = '|_| '
led.7 = '';led.7.1 = ' _  ';led.7.2 = '  | ';led.7.3 = '  | '
led.8 = '';led.8.1 = ' _  ';led.8.2 = '|_| ';led.8.3 = '|_| '
led.9 = '';led.9.1 = ' _  ';led.9.2 = '|_| ';led.9.3 = ' _| '

say "Enter a number: "
pull number .

i = 1
line_1 = ''
line_2 = ''
line_3 = ''

do while i <= length(number)
	num = substr(number,i,1)
	i = i + 1
	line_1 = line_1 || led.num.1
	line_2 = line_2 || led.num.2
	line_3 = line_3 || led.num.3
end

say line_1
say line_2
say line_3
