leds<-list("0"=list(" _  ","| | ","|_| "),
           "1"=list("  ","| ","| "),
           "2"=list(" _  "," _| ","|_  "),
           "3"=list("_  ","_| ","_| "),
           "4"=list("    ","|_| ","  | "),
           "5"=list(" _  ","|_  "," _| "),
           "6"=list(" _  ","|_  ","|_| "),
           "7"=list("_   "," |  "," |  "),
           "8"=list(" _  ","|_| ","|_| "),
           "9"=list(" _  ","|_| "," _| "))

p_number<-readline("Enter a number?: ")
l_number<-strsplit(p_number,"")
for(i in 1:3){
  for(j in 1:nchar(p_number)){
    cat(leds[[l_number[[1]][j]]][[i]])
  }
  cat("\n")
}
