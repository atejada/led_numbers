import scala.util.{Try, Success, Failure}

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

val num = scala.io.StdIn.readLine("Please enter an Number: ")
if(Try(num.toDouble).isSuccess){
	for( x <- 0 to 2 ) {
		for( y <- 0 to num.length - 1 ) {
			print(leds(num(y).toString)(x))
		}
		println("")
	}
}else{
	println("Please enter a number!")
}
