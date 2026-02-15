array set leds {
'0' " _  ,| | ,|_| "
'1' "  ,| ,| "
'2' " _  , _| ,|_  "
'3' "_  ,_| ,_| "
'4' "    ,|_| ,  | "
'5' " _  ,|_  , _| "
'6' " _  ,|_  ,|_| "
'7' "_   , |  , |  "
'8' " _  ,|_| ,|_| "
'9' " _  ,|_| , _| "
}

puts -nonewline "Enter a number: "
flush stdout
set num [gets stdin]

set numArray [split $num ""]

for {set i 0} {$i < [llength $numArray]} {incr i 1} {
	set line [split $leds('[lindex $numArray $i]') ","]
	lassign $line field1 field2 field3
	append line1 $field1
	append line2 $field2
	append line3 $field3
}

puts $line1
puts $line2
puts $line3
