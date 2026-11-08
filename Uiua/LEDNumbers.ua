LEDs ← [
  [" _ " "| |" "|_|"]
  ["   " "  |" "  |"]
  [" _ " " _|" "|_ "]
  [" _ " " _|" " _|"]
  ["   " "|_|" "  |"]
  [" _ " "|_ " " _|"]
  [" _ " "|_ " "|_|"]
  [" _ " "  |" "  |"]
  [" _ " "|_|" "|_|"]
  [" _ " "|_|" " _|"]
]

&pf "Enter a number: "
Input ← &sc

Digits ← ≡⋕ Input

Selected ← ⊏ Digits LEDs

Indices ← ⇡ ⧻ Digits

Top ← /⊂ ≡(⊏ 0) Selected
Middle ← /⊂ ≡(⊏ 1) Selected
Bottom ← /⊂ ≡(⊏ 2) Selected

&p Top
&p Middle
&p Bottom
