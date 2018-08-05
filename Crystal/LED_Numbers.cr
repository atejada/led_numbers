leds = {0 => [" _  ","| | ","|_| "],
        1 => ["  ","| ","| "],
        2 => [" _  "," _| ","|_  "],
        3 => ["_  ","_| ","_| "],
        4 => ["    ","|_| ","  | "],
        5 => [" _  ","|_  "," _| "],
        6 => [" _  ","|_  ","|_| "],
        7 => ["_   "," |  "," |  "],
        8 => [" _  ","|_| ","|_| "],
        9 => [" _  ","|_| "," _| "]}

print "Enter a number: "
num = gets.as(String).strip

i = 0
loop do
  j = 0
  loop do
    print leds[num[j].to_i][i]
    break if j == num.size - 1
    j += 1
  end
  puts ""
  break if i == 2
  i += 1
end
