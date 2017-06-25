; Example: Square Roots by Newton's Method


(define (sqrt x)
  (sqrt-iter x 1 0.001))

(define (sqrt-iter x guess close)
  (if (good-enough? x guess close)
      guess
      (sqrt-iter x
                 (improve x guess)
                 close)))

(define (square x)
  (* x x))

(define (good-enough? x guess close)
  (< (abs (- x (square guess))) close))

(define (average x y)
  (/ (+ x y) 2))

(define (improve x guess)
  (average guess (/ x guess)))
