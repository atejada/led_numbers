import ballerina/io;
import ballerina/regex;

public function main() {
  map<string> leds = {
    "0": " _  ,| | ,|_| ",
    "1": "  ,| ,| ",
    "2": " _  , _| ,|_  ",
    "3": "_  ,_| ,_| ",
    "4": "    ,|_| ,  | ",
    "5": " _  ,|_  , _| ",
    "6": " _  ,|_  ,|_| ",
    "7": "_   , |  , |  ",
    "8": " _  ,|_| ,|_| ",
    "9": " _  ,|_| , _| "
  };
  
  string num = io:readln("Enter a number: ");
  foreach int i in int:range(0, 3, 1) {
    foreach string j in num{
      string[] line = regex:split(leds.get(j), ",");
      io:print(line[i]);
    }
    io:println("");
  }
}
