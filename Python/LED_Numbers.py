leds = {0: [" _  ","| | ","|_| "],
    	1: ["  ","| ","| "],
	2: [" _  "," _| ","|_  "],
	3: ["_  ","_| ","_| "],
        4: ["    ","|_| ","  | "],
        5: [" _  ","|_  "," _| "],
	6: [" _  ","|_  ","|_| "],
	7: ["_   "," |  "," |  "],
	8: [" _  ","|_| ","|_| "],
	9: [" _  ","|_| "," _| "]}

number = str(input("Enter a number: "))
led_line = ""
for i in range(0, 3):
    for j in range(0, len(number)):
        led_line += leds[int(number[j])][i]
    led_line += "\n"
print(led_line)
