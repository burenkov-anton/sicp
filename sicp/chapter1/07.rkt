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

(check-equal? (round (* 1000 (sqrt 4.0))) 2000.0)
(check-equal? (round (* 1000 (sqrt 100.0))) 10000.0)
(check-equal? (round (* 1000 (sqrt 1000000.0))) 1000000.0)
(check-equal? (round (* 1000 (sqrt 0.04))) 200.0)
