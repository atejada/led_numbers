open Core.Std

let get_leds number =
let leds = [0, [" _  ";"| | ";"|_| "];
    	    1, ["  ";"| ";"| "];
			2, [" _  ";" _| ";"|_  "];
			3, ["_  ";"_| ";"_| "];
            4, ["    ";"|_| ";"  | "];
            5, [" _  ";"|_  ";" _| "];
            6, [" _  ";"|_  ";"|_| "];
			7, ["_   ";" |  ";" |  "];
            8, [" _  ";"|_| ";"|_| "];
            9, [" _  ";"|_| ";" _| "]] in
	for i = 0 to 2 do
		for j = 0 to String.length(number) - 1 do
			let line = List.Assoc.find_exn leds 
					   (int_of_string(Char.to_string(number.[j]))) in
			printf "%s" (List.nth_exn line i)
		done;
		print_string "\n"
	done
	
let () =
	print_string "Enter a number: "
	let num = read_line() in
	get_leds num
