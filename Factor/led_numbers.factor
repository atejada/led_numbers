! Copyright (C) 2018 Blag.
! See http://factorcode.org/license.txt for BSD license.
USING: prettyprint kernel io math math.functions sequences generalizations math.parser command-line namespaces ;
IN: led_numbers

<PRIVATE

: first_line ( x -- )
  dup 0 = [ " _  " write ] [ ] if dup 1 = [ "  " write ] [ ] if
  dup 2 = [ " _  " write ] [ ] if dup 3 = [ "_  " write ] [ ] if
  dup 4 = [ "    " write ] [ ] if dup 5 = [ " _  " write ] [ ] if 
  dup 6 = [ " _  " write ] [ ] if dup 7 = [ "_   " write ] [ ] if 
  dup 8 = [ " _  " write ] [ ] if dup 9 = [ " _  " write ] [ ] if 
  drop ;

: second_line ( x -- )
  dup 0 = [ "| | " write ] [ ] if dup 1 = [ "| " write ] [ ] if
  dup 2 = [ " _| " write ] [ ] if dup 3 = [ "_| " write ] [ ] if
  dup 4 = [ "|_| " write ] [ ] if dup 5 = [ "|_  " write ] [ ] if 
  dup 6 = [ "|_  " write ] [ ] if dup 7 = [ " |  " write ] [ ] if 
  dup 8 = [ "|_| " write ] [ ] if dup 9 = [ "|_| " write ] [ ] if
  drop ;

: third_line ( x -- )
  dup 0 = [ "|_| " write ] [ ] if dup 1 = [ "| " write ] [ ] if
  dup 2 = [ "|_  " write ] [ ] if dup 3 = [ "_| " write ] [ ] if
  dup 4 = [ "  | " write ] [ ] if dup 5 = [ " _| " write ] [ ] if 
  dup 6 = [ "|_| " write ] [ ] if dup 7 = [ " |  " write ] [ ] if 
  dup 8 = [ "|_| " write ] [ ] if dup 9 = [ " _| " write ] [ ] if 
  drop ;

: numdigits ( x -- x ) log10 1 + 1 /i ;

: split ( x -- x ) dup numdigits [ 10 /mod ] replicate swap drop ;

: lines ( x x x -- ) [ first_line ] each "" print [ second_line ] each "" print [ third_line ] each "\n" print ;

: leds ( x -- ) split reverse dup dup lines ;

: ask-number ( -- ) "Enter a number: " print ;

: read-number ( -- n ) readln string>number ;

PRIVATE>

: led_numbers-run ( -- ) ask-number read-number leds ;

MAIN: led_numbers-run
