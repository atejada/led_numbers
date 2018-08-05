with Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure LED_Numbers is
	package IO renames Ada.Text_IO;
	package Number_IO is new Ada.Text_IO.Integer_IO (Integer);
	type Array_Row is array (1 .. 3) of Unbounded_String;
	type Array_Of_Array_Type is array (1 .. 10) of Array_Row;
	Array_Of_Arrays : Array_Of_Array_Type;
	s1 : Unbounded_String;
	s2 : Character;
	line1 : Unbounded_String;
	line2 : Unbounded_String;
	line3 : Unbounded_String;
	num : Integer;
	len : Natural;
begin 
	Array_Of_Arrays (1) (1) := s1 & " _  ";Array_Of_Arrays (1) (2) := S1 & "| | ";Array_Of_Arrays (1) (3) := S1 & "|_| ";
	Array_Of_Arrays (2) (1) := s1 & "  ";Array_Of_Arrays (2) (2) := S1 & "| ";Array_Of_Arrays (2) (3) := S1 & "| ";
	Array_Of_Arrays (3) (1) := s1 & " _  ";Array_Of_Arrays (3) (2) := S1 & " _| ";Array_Of_Arrays (3) (3) := S1 & "|_  ";
	Array_Of_Arrays (4) (1) := s1 & "_  ";Array_Of_Arrays (4) (2) := S1 & "_| ";Array_Of_Arrays (4) (3) := S1 & "_| ";
	Array_Of_Arrays (5) (1) := s1 & "    ";Array_Of_Arrays (5) (2) := S1 & "|_| ";Array_Of_Arrays (5) (3) := S1 & "  | ";
	Array_Of_Arrays (6) (1) := s1 & " _  ";Array_Of_Arrays (6) (2) := S1 & "|_  ";Array_Of_Arrays (6) (3) := S1 & " _| ";
	Array_Of_Arrays (7) (1) := s1 & " _  ";Array_Of_Arrays (7) (2) := S1 & "|_  ";Array_Of_Arrays (7) (3) := S1 & "|_| ";
	Array_Of_Arrays (8) (1) := s1 & "_   ";Array_Of_Arrays (8) (2) := S1 & " |  ";Array_Of_Arrays (8) (3) := S1 & " |  ";
	Array_Of_Arrays (9) (1) := s1 & " _  ";Array_Of_Arrays (9) (2) := S1 & "|_| ";Array_Of_Arrays (9) (3) := S1 & "|_| ";
	Array_Of_Arrays (10) (1) := s1 & " _  ";Array_Of_Arrays (10) (2) := S1 & "|_| ";Array_Of_Arrays (10) (3) := S1 & " _| ";		
	IO.Put("Enter a number: ");
	Number_IO.Get(num);
	s1 := s1 & Integer'Image(num);
	len := Length(s1);
	for i in Integer range 2..len loop
		s2 := Element(s1,i);
		num := Character'Pos(s2) - 48;
		if num < 10 then
			num := num + 1;
		end if;
		line1 := line1 & Array_Of_Arrays (num) (1);
		line2 := line2 & Array_Of_Arrays (num) (2);
		line3 := line3 & Array_Of_Arrays (num) (3);
	end loop;
	IO.Put(To_String(line1));
	IO.Put_Line("");
	IO.Put(To_String(line2));
	IO.Put_Line("");
	IO.Put(To_String(line3));
end LED_Numbers;
