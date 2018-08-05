include get.e
include std/map.e
include std/convert.e
include std/sequence.e

sequence num
sequence snum
object onum
atom anum
map leds = new()
   put(leds, 0, {" _  ","| | ","|_| "})
   put(leds, 1, {"  ","| ","| "})
   put(leds, 2, {" _  "," _| ","|_  "})
   put(leds, 3, {"_  ","_| ","_| "})
   put(leds, 4, {"    ","|_| ","  | "})
   put(leds, 5, {" _  ","|_  "," _| "})
   put(leds, 6, {" _  ","|_  ","|_| "})
   put(leds, 7, {"_   "," |  "," |  "})
   put(leds, 8, {" _  ","|_| ","|_| "})
   put(leds, 9, {" _  ","|_| "," _| "})
   
num = prompt_string("Enter a number: ")
snum = breakup(num,1)
for i = 1 to 3 do
        for j = 1 to length(num) do
            anum = to_number(snum[j])
            onum = map:get(leds,anum)
            puts(1,onum[i])
        end for
        puts(1,"\n")
end for
puts(1,"\n")
