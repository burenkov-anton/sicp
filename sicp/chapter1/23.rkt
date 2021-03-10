#lang sicp

(#%require rackunit)

(define (square x) (* x x))

(define (next x)
  (if (= x 2)
      3
      (+ x 2)))

(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))
(define (divides? a b)
  (= (remainder b a) 0))

(check-equal? (next 2) 3)
(check-equal? (next 3) 5)
(check-equal? (next 4) 6)
(check-equal? (smallest-divisor 4) 2)
(check-equal? (smallest-divisor 21) 3)
(check-equal? (smallest-divisor 1999) 1999)
