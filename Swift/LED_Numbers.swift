import Foundation

var leds: [Character: String] = [
    "0": " _  ,| | ,|_| ",
    "1": "  ,| ,| ",
    "2": " _  , _| ,|_  ",
    "3": "_  ,_| ,_| ",
    "4": "    ,|_| ,  | ",
    "5": " _  ,|_  , _| ",
    "6": " _  ,|_  ,|_| ",
    "7": "_   , |  , |  ",
    "8": " _  ,|_| ,|_| ",
    "9": " _  ,|_| , _| "]

print("Enter a number:")
let num = readLine(strippingNewline: true)

for i in 0...2{
  for character in num!{
    let line : String = leds[character] ?? ""
    let lines : [String] = line.components(separatedBy: ",")
    print(lines[i], terminator: "")
  }
  print("")
}
