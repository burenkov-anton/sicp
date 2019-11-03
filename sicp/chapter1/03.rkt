#lang sicp

(#%require rackunit)

(define (sqr x) (* x x))

(define (sum-of-squares x y)
  (+ (sqr x) (sqr y)))

(define (sum-of-squares-max-2-of-3 a b c)
  (if (>= a b)
      (if (> b c)
          (sum-of-squares a b)
          (sum-of-squares a c))
      (if (> a c)
          (sum-of-squares a b)
          (sum-of-squares b c))))

(check-equal? (sum-of-squares-max-2-of-3 1 2 3) 13)

(check-equal? (sum-of-squares-max-2-of-3 4 2 3) 25)