#lang sicp

(#%require rackunit)

(define (compose f g)
  (lambda (y) (f (g y))))

(define (square x)
  (* x x))

(define (repeated f x)
  (lambda (y) ((repeated-iter f f x) y)))

(define (repeated-iter f g x)
  (cond ((= x 1)  f)
        ((> x 1) (repeated-iter (compose f g) g (- x 1)))))

(check-equal? ((repeated square 1) 6) 36)
(check-equal? ((repeated square 2) 5) 625)
(check-equal? ((repeated inc 10) 10) 20)