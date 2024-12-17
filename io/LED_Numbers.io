led := Map clone
led atPut("0", " _  ,| | ,|_| ")
led atPut("1", "  ,| ,| ")
led atPut("2", " _  , _| ,|_  ")
led atPut("3", "_  ,_| ,_| ")
led atPut("4", "    ,|_| ,  | ")
led atPut("5", " _  ,|_  , _| ")
led atPut("6", " _  ,|_  ,|_| ")
led atPut("7", "_   , |  , |  ")
led atPut("8", " _  ,|_| ,|_| ")
led atPut("9", " _  ,|_| , _| ")

"Enter a number: " print
number := File standardInput readLine

line := method(a, b, led at(number at(a) asCharacter) split(",","\n") at(b) print)

digits := method(a, for(j,0,number size - 1, line(j, a)) "\n" print)

for(i,0,2, digits(i))
