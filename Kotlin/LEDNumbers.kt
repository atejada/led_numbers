package LEDNumbers

fun main(args: Array<String>) {
	if (args.size == 0) {
      println("Please provide a number...")
      return
    }
    val NumList:List<String> = args[0].split("")
	val Leds = mapOf("0" to listOf(" _  ", "| | ", "|_| "), 
	                 "1" to listOf("  ", "| ", "| "),
	                 "2" to listOf(" _  "," _| ","|_  "),
	                 "3" to listOf("_  ","_| ","_| "),
	                 "4" to listOf("    ","|_| ","  | "),
	                 "5" to listOf(" _  ","|_  "," _| "),
	                 "6" to listOf(" _  ","|_  ","|_| "),
	                 "7" to listOf("_   "," |  "," |  "),
	                 "8" to listOf(" _  ","|_| ","|_| "),
	                 "9" to listOf(" _  ","|_| "," _| "))
	for(i in 0..2){
		for(j in 1..NumList.size - 2){
			print(Leds[NumList[j]]!![i])
		}
		print("\n")
	}                 
}
