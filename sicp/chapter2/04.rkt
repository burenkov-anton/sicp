#lang sicp

(#%require rackunit)

(define (cons1 x y)
  (lambda (m) (m x y)))

(define (car1 z)
  (z (lambda (p q) p)))

(define (cdr1 z)
  (z (lambda (p q) q)))

(define x 2)

(define y 3)

(define pair (cons x y))

(define pair1 (cons1 x y))

(check-equal? (car pair) (car1 pair1))
(check-equal? (cdr pair) (cdr1 pair1))
