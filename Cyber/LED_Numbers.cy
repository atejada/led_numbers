use os

var leds = Map{
  0 = " _  ,| | ,|_| ",
  1 = "  ,| ,| ",
  2 = " _  , _| ,|_  ",
  3 = "_  ,_| ,_| ",
  4 = "    ,|_| ,  | ", 
  5 = " _  ,|_  , _| ",
  6 = " _  ,|_  ,|_| ",
  7 = "_   , |  , |  ",
  8 = " _  ,|_| ,|_| ",
  9 = " _  ,|_| , _| "
}

var lines = {_}
var line = ""
var counter = 0

print "Enter a number: "
var num = os.readLine()

for 0..3 -> i:
  counter = 0
  line = ""
  for 1..num.len() + 1 -> j:
    lines = leds[num[counter..j]].split(",")
    line = line + lines[i]
    counter = counter + 1
  print line
