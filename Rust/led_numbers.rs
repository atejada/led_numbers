use std::io;
use std::collections::HashMap;

fn main(){
	let mut leds:HashMap<&str, &str> = HashMap::new();

	leds.insert("0", " _  ,| | ,|_| ");
	leds.insert("1", "  ,| ,| ");
	leds.insert("2", " _  , _| ,|_  ");
	leds.insert("3", "_  ,_| ,_| ");
	leds.insert("4", "    ,|_| ,  | ");	
	leds.insert("5", " _  ,|_  , _| ");
	leds.insert("6", " _  ,|_  ,|_| ");
	leds.insert("7", "_   , |  , |  ");
	leds.insert("8", " _  ,|_| ,|_| ");
	leds.insert("9", " _  ,|_| , _| ");

	println!("Enter a number : ");
	let mut input_text = String::new();
	io::stdin().read_line(&mut input_text)
	           .expect("failed to read");

	let split = input_text.split("");
	let vec: Vec<&str> = split.collect();
	let count = &vec.len() - 2;
	
	for i in 0..3{
		for j in 0..count{
			match leds.get(&vec[j]){
				Some(led_line) => { 
					let line = led_line.split(",");
					let vec_line: Vec<&str> = line.collect();
					print!("{}",&vec_line[i]);
					},
				None => println!("")
			}
		}
		print!("");
	}
	
	println!("");
}
