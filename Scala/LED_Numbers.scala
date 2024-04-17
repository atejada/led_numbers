@main def ledNumbers(num: Int) =
for( x <- 0 to 2 ) {
    for( y <- 0 to num.toString.length - 1 ) {
	val s_num = num.toString
	print(leds(s_num(y).toString)(x))
    }
    println("")
}

val leds = Map("0" -> List(" _  ","| | ","|_| "),
               "1" -> List("  ","| ","| "),
               "2" -> List(" _  "," _| ","|_  "),
               "3" -> List("_  ","_| ","_| "),
               "4" -> List("    ","|_| ","  | "),
               "5" -> List(" _  ","|_  "," _| "),
               "6" -> List(" _  ","|_  ","|_| "),
               "7" -> List("_   "," |  "," |  "),
               "8" -> List(" _  ","|_| ","|_| "),
               "9" -> List(" _  ","|_| "," _| "))
