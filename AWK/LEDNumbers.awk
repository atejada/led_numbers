BEGIN {
  leds["0"] = " _  ,| | ,|_| "
  leds["1"] = "    , |  , |  "
  leds["2"] = " _  , _| ,|_  "
  leds["3"] = " _  , _| , _| "
  leds["4"] = "    ,|_| ,  | "
  leds["5"] = " _  ,|_  , _| "
  leds["6"] = " _  ,|_  ,|_| "
  leds["7"] = "_   , |  , |  "
  leds["8"] = " _  ,|_| ,|_| "
  leds["9"] = " _  ,|_| , _| "

  printf "Enter a number: "
  getline num
  
  for (i = 1; i <= length(num); i++) {
    split(leds[substr(num, i, 1)], parts, ",")
    line1 = line1 parts[1]
    line2 = line2 parts[2]
    line3 = line3 parts[3]
  }	
  
  print line1
  print line2
  print line3
}

