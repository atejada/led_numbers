(def leds
  {
    "0" [" _ " "| |" "|_|"]
    "1" ["   " "  |" "  |"]
    "2" [" _ " " _|" "|_ "]
    "3" [" _ " " _|" " _|"]
    "4" ["   " "|_|" "  |"]
    "5" [" _ " "|_ " " _|"]
    "6" [" _ " "|_ " "|_|"]
    "7" [" _ " "  |" "  |"]
    "8" [" _ " "|_|" "|_|"]
    "9" [" _ " "|_|" " _|"]
  })

(defn render [number]
  (var line1 "")
  (var line2 "")
  (var line3 "")

  (for i 0 (length number)
    (def digit (string/slice number i (+ i 1)))
    (def parts (get leds digit ["   " "   " "   "]))

    (set line1 (string line1 (get parts 0) " "))
    (set line2 (string line2 (get parts 1) " "))
    (set line3 (string line3 (get parts 2) " ")))

  (print line1)
  (print line2)
  (print line3))

(prin "Enter a number: ")

(def input
  (string/trim
    (or (file/read stdin :line) "")))

(render input)
