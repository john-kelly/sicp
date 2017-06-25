; Alyssa P. Hacker doesn't see why `if` needs to be provided as a special form.
; "Why can't I just define it as an ordinary procedure in terms of `cond`?" she
; asks. Alyssa's friend Eva Lu Ator claims this can indeed be done, and she
; defines a new version of `if`:

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

; Eva demonstrates the program for Alyssa:

(new-if (= 2 3) 0 5)
; 5

(new-if (= 1 1) 0 5)
; 0


; Delighted, Alyssa uses new-if to rewrite the square-root program:

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
      guess
      (sqrt-iter (improve x guess)
                 x)))

; What happens when Alyssa attempts to use this function?
; Infinte Loop. When `if` is not a special expression, both branchs are always eval'd.
; This means that every call to `sqrt-iter` requires another call to `sqrt-iter`
; which requires another call to `sqrt-iter`... etc... When `if` is a special
; expression, it is possible to call `sqrt-iter` such that it does *not* require
; another call to `sqrt-iter` -- thanks to the fact that the special expression
; `if` only evaluates the else branch if the predicate is false.
