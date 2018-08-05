package main

import "fmt"

func main() {
	fmt.Print("Enter a number: ")
	var num string
	fmt.Scanf("%s", &num)
	leds := map[string][]string {
		"0" : []string{" _  ","| | ","|_| "},
		"1" : []string{"  ","| ","| "},
		"2" : []string{" _  "," _| ","|_  "},
		"3" : []string{"_  ","_| ","_| "},
		"4" : []string{"    ","|_| ","  | "},
		"5" : []string{" _  ","|_  "," _| "},
		"6" : []string{" _  ","|_  ","|_| "},
		"7" : []string{"_   "," |  "," |  "},
		"8" : []string{" _  ","|_| ","|_| "},
		"9" : []string{" _  ","|_| "," _| "},
	}
	for i := 0; i < 3; i++ {
		for j := 0; j < len(num); j++ {
			fmt.Print(leds[string(num[j])][i])
		}
		fmt.Print("\n")
	}
}
