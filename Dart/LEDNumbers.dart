import 'dart:io';
import 'dart:collection';

void main() {
	var leds = HashMap.from({'0': [" _  ","| | ","|_| "], 
		                     '1': ["  ","| ","| "],
		                     '2': [" _  "," _| ","|_  "],
		                     '3': ["_  ","_| ","_| "],
		                     '4': ["    ","|_| ","  | "],
		                     '5': [" _  ","|_  "," _| "],
		                     '6': [" _  ","|_  ","|_| "],
		                     '7': ["_   "," |  "," |  "],
		                     '8': [" _  ","|_| ","|_| "],
		                     '9': [" _  ","|_| "," _| "]});
	
	var line1 = '';
	var line2 = '';
	var line3 = '';
	stdout.write('Enter a number: ');
	String num = stdin.readLineSync() ?? ''; 
	List<String> nums = num.split('');
	
	for (var i = 0; i < nums.length; i++) {
		line1 += leds[nums[i]][0];
		line2 += leds[nums[i]][1];
		line3 += leds[nums[i]][2];
	}
	
	print("$line1");
	print("$line2");
	print("$line3");
}
