using Compat

leds =  @compat Dict("0" => [" _  ","| | ","|_| "],
					 "1" => ["  ","| ","| "],
				     "2" => [" _  "," _| ","|_  "],
					 "3" => ["_  ","_| ","_| "],
					 "4" => ["    ","|_| ","  | "],
					 "5" => [" _  ","|_  "," _| "],
				     "6" => [" _  ","|_  ","|_| "],
					 "7" => ["_   "," |  "," |  "],
					 "8" => [" _  ","|_| ","|_| "],
					 "9" => [" _  ","|_| "," _| "])

print("Enter a number: "); 
number = chomp(readline(STDIN))
len = length(number)
for i in [1:3]
	for j in [1:len]
		print(leds[string(number[j])][i])
	end
	print("\n")
end
