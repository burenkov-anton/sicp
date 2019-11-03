#lang sicp

(#%require rackunit)

(define (sqr x) (* x x))

(define (cube x) (* x x x))

(define (improve guess x)
  (/ (+ (* 2 guess) (/ x (sqr guess))) 3))

(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) 0.000001))

(define (cube-root-iter guess x)
  (if (good-enough? guess x)
      guess
      (cube-root-iter (improve guess x) x)))

(define (cube-root x)
  (cube-root-iter 1.0 x))



(check-equal? (round (cube-root 27)) 3.0)

(check-equal? (round (cube-root 1000)) 10.0)