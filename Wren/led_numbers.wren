import "io" for Stdin

class Led{
	static toLed(value){
		var led_table = {0: [" _  ","| | ","|_| "],
		                          1: ["  ","| ","| "],
		                          2: [" _  "," _| ","|_  "],
		                          3: ["_  ","_| ","_| "],
		                          4: ["    ","|_| ","  | "],
		                          5: [" _  ","|_  "," _| "],
		                          6: [" _  ","|_  ","|_| "],
		                          7: ["_   "," |  "," |  "],
		                          8: [" _  ","|_| ","|_| "],
		                          9: [" _  ","|_| "," _| "]
		 }
		 var led_num = ""
		 for(x in 0..2){
		   for(y in 0..value.count - 1){
		     led_num = led_num + led_table[Num.fromString(value[y])][x]
		   }
		   led_num = led_num + "\n"
		 }
		 return led_num
	}
}

System.print("Enter a number: ")
var num = Stdin.readLine().trim()
System.print(Led.toLed(num))
