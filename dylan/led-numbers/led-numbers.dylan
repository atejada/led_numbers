Module: led-numbers

define variable *led-table* = make(<table>, size: 10);

*led-table*['0'] := " _  ,| | ,|_| ";
*led-table*['1'] := "  ,| ,| ";
*led-table*['2'] := " _  , _| ,|_  ";
*led-table*['3'] := "_  ,_| ,_| ";
*led-table*['4'] := "    ,|_| ,  | ";
*led-table*['5'] := " _  ,|_  , _| ";
*led-table*['6'] := " _  ,|_  ,|_| ";
*led-table*['7'] := "_   , |  , |  ";
*led-table*['8'] := " _  ,|_| ,|_| ";
*led-table*['9'] := " _  ,|_| , _| ";

define method led-numbers()
	let i = 0;
	let val = "";
	let line = "";
	let line1 = "";
	let line2 = "";
	let line3 = "";
	format-out("Enter a number: ");
	force-out();
	let num = read-line(*standard-input*);
	while(i < num.size)
		line := *led-table*[num[i]];
		val := split(line,',');
		line1 := concatenate!(line1, val[0]);
		line2 := concatenate!(line2, val[1]);
		line3 := concatenate!(line3, val[2]);
		i := i + 1;
	end while;
	format-out("%s\n", line1);
	format-out("%s\n", line2);
	format-out("%s\n\n", line3);
end method led-numbers;
 
led-numbers();
