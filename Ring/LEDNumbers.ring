Load "stdlibcore.ring"

leds = [
    :0 = " _  ,| | ,|_| ",
    :1 = "    , |  , |  ",
    :2 = " _  , _| ,|_  ",
    :3 = " _  , _| , _| ",
    :4 = "    ,|_| ,  | ",
    :5 = " _  ,|_  , _| ",
    :6 = " _  ,|_  ,|_| ",
    :7 = "_   , |  , |  ",
    :8 = " _  ,|_| ,|_| ",
    :9 = " _  ,|_| , _| "
]

see "Enter a number: "
give number

line_1 = ""
line_2 = ""
line_3 = ""

for num in number
	line = leds[num]
	lines = SplitMany(line, ",")
	line_1 = line_1 + lines[1]
	line_2 = line_2 + lines[2]
	line_3 = line_3 + lines[3]
next

? line_1
? line_2
? line_3
