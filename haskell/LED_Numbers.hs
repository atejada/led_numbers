showLED :: Int -> IO()
showLED(num) = do
	putStr(get_led (digits num) 0 num)

get_led :: [Int] -> Int -> Int -> String
get_led (x:xs) n num = leds !! x !! n ++ get_led(xs) n num
	where leds = [[" _  ","| | ","|_| "],
                     ["  ","| ","| "],
                     [" _  "," _| ","|_  "],
                     ["_  ","_| ","_| "],
                     ["    ","|_| ","  | "],
                     [" _  ","|_  "," _| "],
                     [" _  ","|_  ","|_| "],
                     ["_   "," |  "," |  "],
                     [" _  ","|_| ","|_| "],
                     [" _  ","|_| "," _| "]]
get_led [] n num
	| n < 2 = "" ++ "\n" ++ get_led(digits num) (n+1) num
	| n == 2 = "" ++ "\n"

digits :: Int -> [Int]
digits = map (read . (:[])) . show
