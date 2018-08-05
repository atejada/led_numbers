defmodule LED_Numbers do
  def showLED(num) when is_number(num) do
    digits = for x <- to_charlist(num) do
               x - 48
             end
    leds = %{0 => {" _  ","| | ","|_| "},
             1 => {"  ","| ","| "},
             2 => {" _  "," _| ","|_  "},
             3 => {"_  ","_| ","_| "},
             4 => {"    ","|_| ","  | "},
             5 => {" _  ","|_  "," _| "},
             6 => {" _  ","|_  ","|_| "},
             7 => {"_   "," |  "," |  "},
             8 => {" _  ","|_| ","|_| "},
             9 => {" _  ","|_| "," _| "}}
	build_output(digits,digits,leds,0,"")	     
  end
  
  def build_output(_,_,_,3,acc) do
    IO.puts(acc)
  end
  
  def build_output([],digits,leds,lineNo,acc) do
    build_output(digits,digits,leds,lineNo + 1,acc <> "\n")
  end
  
  def build_output([h|t],digits,leds,lineNo,acc) do
    build_output(t,digits,leds,lineNo,acc <> elem(leds[h],lineNo))
  end  
end
