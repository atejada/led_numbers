import tables, parseutils

let leds = toTable[int, array[0..2,string]](
  {
  0: [" _  ","| | ","|_| "],
  1: ["  ","| ","| "],
  2: [" _  "," _| ","|_  "],
  3: ["_  ","_| ","_| "],
  4: ["    ","|_| ","  | "],
  5: [" _  ","|_  "," _| "],
  6: [" _  ","|_  ","|_| "],
  7: ["_   "," |  "," |  "],
  8: [" _  ","|_| ","|_| "],
  9: [" _  ","|_| "," _| "]
  }
)

stdout.write("Enter a number: ")
let num = stdin.readLine()

for i in countup(0, 2):
  for item in num:
    var iNum = 0
    discard parseInt($item, iNum) 
    stdout.write(leds[iNum][i])
  echo("")
