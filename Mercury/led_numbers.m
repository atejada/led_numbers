:- module led_numbers.
:- interface.
:- import_module io.

:- pred main(io::di, io::uo) is det.

:- implementation.
:- import_module list, string, int, array, char.

:- pred get_leds(list.list(character)::in, list.list(character)::in, 
                 int::in, list.list(string)::out ) is det.
	
get_leds(Ldigits, Ldigits_aux, N, Response) :-
	(
		Leds = array([array([" _  ","| | ","|_| "]),
		              array(["  ","| ","| "]),
		              array([" _  "," _| ","|_  "]),
		              array(["_  ","_| ","_| "]),
		              array(["    ","|_| ","  | "]),
		              array([" _  ","|_  "," _| "]),
		              array([" _  ","|_  ","|_| "]),
		              array(["_   "," |  "," |  "]),
		              array([" _  ","|_| ","|_| "]),
		              array([" _  ","|_| "," _| "])]),
		list.length(Ldigits,Len),
		( if Len > 0 then
			Head = det_head(Ldigits),
			Tail = det_tail(Ldigits),
			char.to_int(Head, Head_I:int),
			Head_N:int = Head_I - 48,
			Line = elem(Head_N, Leds),
			Sub_Line = elem(N, Line),
			get_leds(Tail, Ldigits_aux, N, Result),
			Response = [Sub_Line] ++ Result
		  else if N < 2 then
			get_leds(Ldigits_aux, Ldigits_aux, N+1, Result),
			Response = ["\n"]  ++ Result
		  else if N = 2 then
			Response = ["\n"]
		  else
			Response = [] )
	).	
	
main(!IO) :-
	io.write_string("Enter a number: ",!IO),
	io.read_line_as_string(Result, !IO),
	(	if
			Result = ok(String),
			Num = string.strip(String),
			to_char_list(Num,Ldigits),
			get_leds(Ldigits, Ldigits, 0, Response)
		then
			io.write_string(string.join_list("", Response), !IO)
		else
			io.write_string("Not a number...",!IO)
	).
