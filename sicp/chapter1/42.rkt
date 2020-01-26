#lang sicp

(#%require rackunit)

(define (compose f g)
  (lambda (y) (f (g y))))

(define (inc x)
  (+ x 1))

(define (double x)
  (* x 2))

(define (square x)
  (* x x))

(check-equal? ((compose square inc) 6) 49)
(check-equal? ((compose inc double) 6) 13)
(check-equal? ((compose double inc) 6) 14)