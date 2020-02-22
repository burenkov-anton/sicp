#lang sicp

(#%require rackunit)

(define (pow a b)
  (inexact->exact (exp (* b (log a)))))

(define (nroot a n)
  (inexact->exact (log a n)))

(define (consp a b)
  (cons (pow 2 a) (pow 3 b)))

(define (carp p)
  (nroot (car p) 2))

(define (cdrp p)
  (nroot (cdr p) 3))

(define a 2)

(define b 3)

(define x (consp a b))

(check-equal? x '(4 . 27))
(check-equal? (carp x) a)
(check-equal? (cdrp x) b)
