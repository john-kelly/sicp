; Using the previous version,

; small numbers simply fail bc the closness check is constant (0.001)

; large numbers cause an infinite loop bc small differences in large numbers
; are not always representable

(define (sqrt x)
  (sqrt-iter x 1.0 0))

(define (sqrt-iter x guess prev-guess)
  (if (good-enough? prev-guess guess)
      guess
      (sqrt-iter x
                 (improve x guess)
                 guess)))

(define (square x)
  (* x x))

(define (good-enough? prev-guess guess)
  (< (abs (- prev-guess guess))
     (* guess 0.001)))

; Good explanation from: http://community.schemewiki.org/?sicp-ex-1.7
; [random person]: I don't see why (* guess 0.001) is used. Just '0.001' or
; whatever tolerance desired seems to work fine. It would be nice if someone
; explained above if there is a reason why the (* guess 0.001) is better.

; [SchemeNewb]: Just using 0.001 is, in effect, doing the same thing as the
; original program. It basically says "If the difference between this guess and
; improved guess is less than 0.0001 in absolute terms (as opposed to percent
; terms) then stop improving." Problem with this is the same as explained up
; top. For really tiny numbers, it is easy for the total difference between
; guess and improve guess to be less than .0001 and for the program to stop
; without actually doing anything. For large numbers, it might take forever to
; get to where guess and improved guess are less than .0001. So the book asks
; us to stop the program if improved guess is less than a certain PERCENT of
; guess. And THAT is what this alternative does. It checks to see how close
; guess and improved guess are as a percent. It basically says: "figure out how
; far guess is from improved guess and then see if that amount is less than
; .1% of guess. If it is, stop the program"

(define (average x y)
  (/ (+ x y) 2))

(define (improve x guess)
  (average guess (/ x guess)))
