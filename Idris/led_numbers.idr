module Main

make_led : (String, Int) -> String
make_led("0",1) = " _  "
make_led("0",2) = "| | "
make_led("0",3) = "|_| "
make_led("1",1) = "  "
make_led("1",2) = "| "
make_led("1",3) = "| "
make_led("2",1) = " _  "
make_led("2",2) = " _| "
make_led("2",3) = "|_  "
make_led("3",1) = "_  "
make_led("3",2) = "_| "
make_led("3",3) = "_| "
make_led("4",1) = "    "
make_led("4",2) = "|_| "
make_led("4",3) = "  | "
make_led("5",1) = " _  "
make_led("5",2) = "|_  "
make_led("5",3) = " _| "
make_led("6",1) = " _  "
make_led("6",2) = "|_  "
make_led("6",3) = "|_| "
make_led("7",1) = "_   "
make_led("7",2) = " |  "
make_led("7",3) = " |  "
make_led("8",1) = " _  "
make_led("8",2) = "|_| "
make_led("8",3) = "|_| "
make_led("9",1) = " _  "
make_led("9",2) = "|_| "
make_led("9",3) = " _| "

digits : String -> Nat -> Nat -> List String
digits num len counter = let digit : List String = [] in
						 if counter < len then substr counter 1  num :: digit ++
						              digits num len (counter + 1)
						 else []


show_led : List String -> Int -> String
show_led ldigits counter = let tdigits : List String = tail ldigits{ok = ?NonEmpty} in
						   if length ldigits == 0 then " "
                           else if length ldigits == 1 then
                             make_led(unwords $ take 1 ldigits, counter)
                           else if length ldigits > 1 then
                             make_led(unwords $ take 1 ldigits, counter) ++ show_led tdigits counter
                           else " "

main : IO ();
main = do
		 putStr("Enter a number: ");
		 num <- getLine;
		 putStrLn $ show_led(digits num (length num) 0) 1;
		 putStrLn $ show_led(digits num (length num) 0) 2;
		 putStr $ show_led(digits num (length num) 0) 3;
