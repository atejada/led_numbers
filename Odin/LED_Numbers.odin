package main

import "core:fmt"
import "core:os"
import "core:strings"

main :: proc() {
  leds := map[string]string{"0" = " _  ,| | ,|_| ", 
                            "1" = "  ,| ,| ", 
                            "2" = " _  , _| ,|_  ",
                            "3" = "_  ,_| ,_| ",
                            "4" = "    ,|_| ,  | ",
                            "5" = " _  ,|_  , _| ",
                            "6" = " _  ,|_  ,|_| ",
                            "7" = "_   , |  , |  ",
                            "8" = " _  ,|_| ,|_| ",
                            "9" = " _  ,|_| , _| "}
  
  buf: [256]byte
  fmt.println("Enter a number:")
  num, err := os.read(os.stdin, buf[:])
  str := string(buf[:num])
  digits := strings.split(strings.trim(str,"\n"), "")
    
  for i in 0..=2 {
	for j in digits {
	  lines := strings.split(leds[j], ",")
	  fmt.print(lines[i])
    }
    fmt.println("")
  }  
}
