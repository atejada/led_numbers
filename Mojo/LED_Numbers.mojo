from PythonInterface import Python
from PythonObject import PythonObject
from String import String
from String import atol

var leds = Python.dict()
leds[0] = [" _  ","| | ","|_| "]
leds[1] = ["  ","| ","| "]
leds[2] = [" _  "," _| ","|_  "]
leds[3] = ["_  ","_| ","_| "]
leds[4] = ["    ","|_| ","  | "]
leds[5] = [" _  ","|_  "," _| "]
leds[6] = [" _  ","|_  ","|_| "]
leds[7] = ["_   "," |  "," |  "]
leds[8] = [" _  ","|_| ","|_| "]
leds[9] = [" _  ","|_| "," _| "]

let num = String("1977")

for x in range(0, 3):
    var result = String("")
    var b = 1
    for y in range(0, len(num)):
        result = result.__add__(leds[atol(num[y:b])][x].to_string())
        b = b + 1
    print(result)
