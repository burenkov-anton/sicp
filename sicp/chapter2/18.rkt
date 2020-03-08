#lang sicp

(#%require rackunit)

(define (reverse x)
  (reverse-iter x nil))

(define (reverse-iter x y)
  (if (null? x)
      y
      (reverse-iter (cdr x) (cons (car x) y))))

(check-equal? (reverse (list 1)) (list 1))
(check-equal? (reverse (list 2 4 6 9)) (list 9 6 4 2))
(check-equal? (reverse nil) nil)