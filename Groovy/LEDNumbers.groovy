def leds = ["0": " _  ,| | ,|_| ",
            "1": "    ,  | ,  | ",
            "2": "  _ ,  _|, |_ ",
            "3": " _  , _| , _| ",
            "4": "    ,|_| ,  | ",
            "5": " _  ,|_  , _| ",
            "6": " _  ,|_  ,|_| ",
            "7": "_   , |  , |  ",
            "8": " _  ,|_| ,|_| ",
            "9": " _  ,|_| , _| "]

def num = System.console().readLine 'Enter a number: '

line1 = ""
line2 = ""
line3 = ""

0.step(num.length(), 1) { digit ->
    line1 += leds[num[digit]][0..3]
    line2 += leds[num[digit]][5..8]
    line3 += leds[num[digit]][10..13]
}


println line1
println line2
println line3
