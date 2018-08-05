#lang racket
(define (showLED num)
  (display(get_led(toList num) 0 num)))

(define (toList num)
         (map (lambda (elem) 
                (first (cons (make-string 1 elem) '()))) 
              (string->list(number->string num))))

(define (get_led x n num)
  (cond [(> (length x) 0)
         (string-append (list-ref (hash-ref leds (string->number(first x))) n) (get_led (rest x) n num))]
        [(and (= (length x) 0) (< n 2)) 
         (string-append "" "\n" (get_led (toList num) (add1 n) num))]
        [(and (= (length x) 0) (= n 2))
         (string-append "" "\n")]))

(define leds (hash '0 (list " _  " "| | " "|_| ") '1 (list "  " "| " "| ")
                   '2 (list " _  " " _| " "|_  ") '3 (list "_  " "_| " "_| ")
                   '4 (list "    " "|_| " "  | ") '5 (list " _  " "|_  " " _| ")
                   '6 (list " _  " "|_  " "|_| ") '7 (list "_   " " |  " " |  ")
                   '8 (list " _  " "|_| " "|_| ") '9 (list " _  " "|_| " " _| ")))
