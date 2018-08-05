let leds: [Character:String] = [
	"0" : " _  ,| | ,|_| ",
	"1" : "  ,| ,| ",
	"2" : " _  , _| ,|_  ",
	"3" : "_  ,_| ,_| ",
	"4" : "    ,|_| ,  | ",
	"5" : " _  ,|_  , _| ",
	"6" : " _  ,|_  ,|_| ",
	"7" : "_   , |  , |  ",
	"8" : " _  ,|_| ,|_| ",
	"9" : " _  ,|_| , _| "
];

print("Enter a number: ",terminator:"");
let num = readLine(strippingNewline: true);

var line = [String]();
var led = "";

for i in 0...2{
	for character in num!.characters{
		line = String(leds[character]!)!.characters.split(separator: ",").map(String.init);
		print(line[i], terminator:"");
	}
	print("");
}
