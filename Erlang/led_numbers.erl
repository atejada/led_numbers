-module(led_Numbers).
-export([showLED/1]).

showLED(Number) when is_integer(Number) ->
	Digits = [ X - 48 || X <- integer_to_list(Number) ],
    Leds = #{0 => {" _  ","| | ","|_| "},
      	     1 => {"  ","| ","| "},
	     2 => {" _  "," _| ","|_  "},
	     3 => {"_  ","_| ","_| "},
             4 => {"    ","|_| ","  | "},
             5 => {" _  ","|_  "," _| "},
	     6 => {" _  ","|_  ","|_| "},
	     7 => {"_   "," |  "," |  "},
	     8 => {" _  ","|_| ","|_| "},
	     9 => {" _  ","|_| "," _| "}},
	build_output(Digits,Digits,Leds,1,"").

build_output([],_,_,3,Acc) -> 
	io:format("~s~n",[Acc]);
build_output([],Digits,Leds,LineNo,Acc) -> 
    build_output(Digits,Digits,Leds,LineNo+1,Acc++"\n");
build_output([H|T],Digits,Leds,LineNo,Acc) -> 
	build_output(T, Digits,Leds,LineNo,Acc++element(LineNo,maps:get(H,Leds))).
