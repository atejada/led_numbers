(local led [" _  ,| | ,|_| " 
            "  ,| ,| " 
            " _  , _| ,|_  "
            "_  ,_| ,_| "
            "    ,|_| ,  | "
            " _  ,|_  , _| "
            " _  ,|_  ,|_| "
            "_   , |  , |  "
            " _  ,|_| ,|_| "
            " _  ,|_| , _| "])

(fn split-by-comma [str]
  (let [parts []]
    (each [part (string.gmatch str "([^,]+)")]
      (table.insert parts part))
    parts))
    
(io.write "Enter a number: ")
(local input (io.read "*l"))

(var line1 "")
(var line2 "")
(var line3 "")

(each [d (input:gmatch "%d")]
  (let [digit-index (+ (tonumber d) 1)
        digit-led (. led digit-index)
        parts (split-by-comma digit-led)]
    (set line1 (.. line1 (. parts 1)))
    (set line2 (.. line2 (. parts 2)))
    (set line3 (.. line3 (. parts 3)))))

(print line1)
(print line2)
(print line3)
