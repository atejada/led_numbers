from python import Python
from collections import Dict

fn main() raises:
    var input = Python.import_module("builtins").input
    var leds = Dict[String, String]() 
    leds["0"] = " _  ,| | ,|_| "
    leds["1"] = "  ,| ,| "
    leds["2"] = " _  , _| ,|_  "
    leds["3"] = "_  ,_| ,_| "
    leds["4"] = "    ,|_| ,  | "
    leds["5"] = " _  ,|_  , _| "
    leds["6"] = " _  ,|_  ,|_| " 
    leds["7"] = "_   , |  , |  "
    leds["8"] = " _  ,|_| ,|_| "
    leds["9"] = " _  ,|_| , _| "
    
    var num = input("Enter a number: ")
    for x in range(0, 3):
      for y in range(0, len(num)):
        var line = leds[num[y]].split(",")
        print(line[x], end="")
      print("")
