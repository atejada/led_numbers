import dictionary;
import std;
import os;

fn main() {
    var leds = dictionary<i64, const u8[:]> {};

    leds.insert(0, " _ ,| |,|_|");
    leds.insert(1, "   ,  |,  |");
    leds.insert(2, " _ , _|,|_ ");
    leds.insert(3, " _ , _|, _|");
    leds.insert(4, "   ,|_|,  |");
    leds.insert(5, " _ ,|_ , _|");
    leds.insert(6, " _ ,|_ ,|_|");
    leds.insert(7, " _ ,  |,  |");
    leds.insert(8, " _ ,|_|,|_|");
    leds.insert(9, " _ ,|_|, _|");
    
    print("Enter a number: ");
    flush_stdout();

    var input: u8[>..] = [];
    var line1: u8[>..] = [];
    var line2: u8[>..] = [];
    var line3: u8[>..] = [];
    
    if !read_line(input) {
        print("Unable to read input.");
        return;
    }    
    
    for ch in input {
        let num = (ch - '0') as i64;
        let led = leds.get(num);
		if led {
			let line = split(led, ',');
			format(line1, " ", line[0]);
			format(line2, " ", line[1]);
			format(line3, " ", line[2]);
		}
    }    
    
	print(line1);
	print(line2);
	print(line3);
}

