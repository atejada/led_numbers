import std::collections::map;
import std::io;
import std::core::string;

fn void main()
{
	HashMap{String, String} led;
	led.init(mem);
	led.set("0"," _  ,| | ,|_| ");
	led.set("1","    , |  , |  ");
	led.set("2"," _  , _| ,|_  ");
	led.set("3"," _  , _| , _| ");
	led.set("4","    ,|_| ,  | ");
	led.set("5"," _  ,|_  , _| ");
	led.set("6"," _  ,|_  ,|_| ");
	led.set("7","_   , |  , |  ");
	led.set("8"," _  ,|_| ,|_| ");
	led.set("9"," _  ,|_| , _| ");

	io::print("Enter a number: ");
	String? line = io::readline(tmem);

	String num, lines, line1, line2, line3;
	String[] list;

	foreach(idx, item: line!!)
	{
		num = string::format(tmem, "%d", (line!![idx] - 48));
		lines = led[num]!!;
		list = lines.split(tmem, ",");
	
		line1 = line1.concat(tmem, list[0]);
		line2 = line2.concat(tmem, list[1]);
		line3 = line3.concat(tmem, list[2]);
	}
	
	io::printn(line1);
	io::printn(line2);
	io::printn(line3);
}
