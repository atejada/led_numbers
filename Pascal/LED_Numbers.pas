program LED_Numbers;

var 
  leds: array [1..10] of string;
  num : string;
  lines : string;
  line_1 : string;
  line_2 : string;
  line_3 : string;
  i : integer;
  j : integer;
  Len: integer;

begin
 leds[1] := ' _  ,| | ,|_| ';
 leds[2] := '    , |  , |  ';
 leds[3] := ' _  , _| ,|_  ';
 leds[4] := ' _  , _| , _| ';
 leds[5] := '    ,|_| ,  | ';
 leds[6] := ' _  ,|_  , _| ';
 leds[7] := ' _  ,|_  ,|_| ';
 leds[8] := '_   , |  , |  ';
 leds[9] := ' _  ,|_| ,|_| ';
 leds[10] := ' _  ,|_| , _| ';
 
 line_1 := '';
 line_2 := '';
 line_3 := '';
 lines := '';
 
 write('Enter a number: ');
 readLn(input, num);
 Len := Length(num);
 for i := 1 to Len do
   begin
     lines := leds[(Ord(num[i]) - 48) + 1];
     for j := 1 to 4 do
       line_1 := line_1 + lines[j];
     for j := 6 to 9 do
       line_2 := line_2 + lines[j];
     for j := 11 to 15 do
       line_3 := line_3 + lines[j];
   end;
  writeln(line_1);
  writeln(line_2);
  writeln(line_3);
end.
