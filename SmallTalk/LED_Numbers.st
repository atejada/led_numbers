| led line lines counter getLine number digit |

led := Dictionary new.
lines := Array new: 3.
line := ''.
counter := 1.

led at: 0 put: ' _  ,| | ,|_| '.
led at: 1 put: '  ,| ,| '.
led at: 2 put: ' _  , _| ,|_  '.
led at: 3 put: '_  ,_| ,_| '.
led at: 4 put: '    ,|_| ,  | '.
led at: 5 put: ' _  ,|_  , _| '.
led at: 6 put: ' _  ,|_  ,|_| '.
led at: 7 put: '_   , |  , |  '.
led at: 8 put: ' _  ,|_| ,|_| '.
led at: 9 put: ' _  ,|_| , _| '.

getLine := [:digit :dline |
	1 to: ((led at: digit) size) do: [:x |
		(((led at: digit) at: x) asString ~= ',') ifTrue: [ 
			line := line , ((led at: digit) at: x) asString.
		] ifFalse: [
			lines at: counter put: line.
			line := ''.
			counter := counter + 1
		].
		lines at: counter put: line.
	].
	Transcript show: ((lines at: dline) asString).
	line := ''.
	counter := 1.
].

Transcript show: 'Enter a number: '.
number := stdin nextLine.
1 to: 3 do: [:y |
	 1 to: (number size) do: [:x |
		digit := ((number at:x) asString) asInteger.
		getLine value: digit value: y.
	].
	Transcript cr.
].
