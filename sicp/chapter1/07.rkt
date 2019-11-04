#lang sicp

(#%require rackunit)

(define (sqr x) (* x x))

(define (average x y) (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- guess x)) 0.00001))

(define (sqrt-iter guess x)
  (if (good-enough? guess (improve guess x))
      guess
      (sqrt-iter (improve guess x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(check-equal? (round (sqrt 4.0)) 2.0)
(check-equal? (round (sqrt 100.0)) 10.0)
