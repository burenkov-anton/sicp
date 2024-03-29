#lang sicp

(#%require rackunit)

(define (double f)
  (lambda (x) (f (f x))))

(define (inc x)
  (+ x 1))

(define (square x)
  (* x x))

(check-equal? ((double inc) 6) 8)
(check-equal? ((double square) 3) 81)
