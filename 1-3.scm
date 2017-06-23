; Define a procedure that takes three numbers as arguments and returns the sum
; of the squares of the two larger numbers.

(define (square x) (* x x))

(define (my-function x y z)
  (if (> x y)
      (if (> y z)
          (+ (square x) (square y))
          (+ (square x) (square z)))
      (if (> x z)
          (+ (square y) (square x))
          (+ (square y) (square z)))))

(my-function 1 2 3)
; 13

(my-function 3 2 1)
; 13

(my-function 0 10 1)
; 101

(my-function 0 0 5)
; 25
