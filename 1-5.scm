; Ben Bitdiddle has invented a test to determine whether the interpreter he is
; faced with is using applicative-order evaluation or normal-order evaluation.
; He defines the following two procedure:

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

; Then he evaluates the expression:

(test 0 (p))

; What happens?

; the trick here is to remember that (p) is calling p!
; applicative-order: infinite loop
; normal-order: 0
