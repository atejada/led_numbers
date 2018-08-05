(def leds {"0" (list " _  " "| | " "|_| ") "1" (list "  " "| " "| ")
           "2" (list " _  " " _| " "|_  ") "3" (list "_  " "_| " "_| ")
           "4" (list "    " "|_| " "  | ") "5" (list " _  " "|_  " " _| ")
           "6" (list " _  " "|_  " "|_| ") "7" (list "_   " " |  " " |  ")
           "8" (list " _  " "|_| " "|_| ") "9" (list " _  " "|_| " " _| ")})

(defn toList [number]
	(map str(seq(str number))))

(defn get_led [x n num]
	(cond 
		(> (count x) 0)
			(concat (nth (get leds (first x)) n) (get_led (rest x) n num))
		(and (= (count x) 0) (< n 2))
			(concat "" "\n" (get_led (toList num) (+ 1 n) num))
		(and (= (count x) 0) (= n 2))
			(concat "" "\n")))

(defn showLED [num]
	(print (apply str (get_led (toList num) 0 num)))(symbol ""))
