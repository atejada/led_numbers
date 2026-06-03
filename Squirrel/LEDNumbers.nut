local leds =
{
    "0" : " _  ,| | ,|_| ",
    "1" : "    , |  , |  ",
    "2" : " _  , _| ,|_  ",
    "3" : " _  , _| , _| ",
    "4" : "    ,|_| ,  | ",
    "5" : " _  ,|_  , _| ",
    "6" : " _  ,|_  ,|_| ",
    "7" : "_   , |  , |  ",
    "8" : " _  ,|_| ,|_| ",
    "9" : " _  ,|_| , _| "
}

function readLine() {
    local line = "";
    try {
        while (true) {
            local c = stdin.readn('c');
            if (c == '\n') break;
            if (c == '\r') continue;
            line += c.tochar();
        }
    } catch(e) {}
    return line;
}

local number = readLine();

local line1 = ""
local line2 = ""
local line3 = ""

foreach(num in number){
	local digit = format("%c", num);
	local parts = split(leds[digit], ",");
	line1 = line1 + parts[0];
	line2 = line2 + parts[1];
	line3 = line3 + parts[2];	    
}

print(line1+"\n");
print(line2+"\n");
print(line3+"\n");
