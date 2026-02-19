use IO;

proc main() {
	var num: string;

	var keys: domain(string);
	var leds: [keys] string;
	var line1: string;
	var line2: string;
	var line3: string;

	keys += "0";
	leds["0"] = " _  ,| | ,|_| ";
	keys += "1";
	leds["1"] = "    , |  , |  ";
	keys += "2";
	leds["2"] = " _  , _| ,|_  ";
	keys += "3";
	leds["3"] = " _  , _| , _| ";
	keys += "4";
	leds["4"] = "    ,|_| ,  | ";
	keys += "5";
	leds["5"] = " _  ,|_  , _| ";
	keys += "6";
	leds["6"] = " _  ,|_  ,|_| ";
	keys += "7";
	leds["7"] = "_   , |  , |  ";
	keys += "8";
	leds["8"] = " _  ,|_| ,|_| ";
	keys += "9";
	leds["9"] = " _  ,|_| , _| ";
	
	write("Give me a number: ");
	stdout.flush();

	readln(num);
	
	for i in 0..num.size - 1 {
		line1 += leds[num[i]][0..3];
		line2 += leds[num[i]][5..8];
		line3 += leds[num[i]][10..13];
	}	
	
	writeln("", line1);
	writeln("", line2);
	writeln("", line3);
}
