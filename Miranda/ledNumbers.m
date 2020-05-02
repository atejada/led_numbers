showLED :: num -> [char]
showLED num = getLED(digits(shownum(num),0))

layno :: [[char]] -> [char]
layno [] = []
layno(a:x) = a ++ layno x

getLED :: [num] -> [char]
getLED(nums) = layno [make_led_digit(x,1) | x <- nums] ++ "\n" ++
			   layno [make_led_digit(x,2) | x <- nums] ++ "\n" ++
			   layno [make_led_digit(x,3) | x <- nums] ++ "\n"

digits :: ([char],num) -> [num]
digits(text,num) = (numval((text ! num) : "") : []) ++ 
                    digits(text,(num + 1)), if (num < # text - 1)
digits(text,num) = (numval((text ! num) : "") : []), if (num < # text)

make_led_digit :: (num,num) -> [char]
make_led_digit(0,1) = " _  "
make_led_digit(0,2) = "| | "
make_led_digit(0,3) = "|_| "
make_led_digit(1,1) = "  "
make_led_digit(1,2) = "| "   
make_led_digit(1,3) = "| "
make_led_digit(2,1) = " _  " 
make_led_digit(2,2) = " _| " 
make_led_digit(2,3) = "|_  "
make_led_digit(3,1) = "_  "
make_led_digit(3,2) = "_| "  
make_led_digit(3,3) = "_| "
make_led_digit(4,1) = "    " 
make_led_digit(4,2) = "|_| " 
make_led_digit(4,3) = "  | "
make_led_digit(5,1) = " _  " 
make_led_digit(5,2) = "|_  " 
make_led_digit(5,3) = " _| "
make_led_digit(6,1) = " _  " 
make_led_digit(6,2) = "|_  " 
make_led_digit(6,3) = "|_| "
make_led_digit(7,1) = "_   " 
make_led_digit(7,2) = " |  " 
make_led_digit(7,3) = " |  "
make_led_digit(8,1) = " _  "
make_led_digit(8,2) = "|_| " 
make_led_digit(8,3) = "|_| "
make_led_digit(9,1) = " _  " 
make_led_digit(9,2) = "|_| " 
make_led_digit(9,3) = " _| "
