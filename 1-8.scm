(define (cubert x)
  (cubert-iter x 1.0 0))

(define (cubert-iter x guess prev-guess)
  (if (good-enough? prev-guess guess)
      guess
      (cubert-iter x
                 (improve x guess)
                 guess)))

(define (square x)
  (* x x))

(define (good-enough? prev-guess guess)
  (< (abs (- prev-guess guess))
     (* guess 0.001)))

(define (average x y)
  (/ (+ x y) 2))

(define (improve x y)
  (/ (+ (/ x (square y))
        (* 2 y))
     3))
