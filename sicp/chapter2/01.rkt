#lang sicp

(#%require rackunit)

(define (make-rat n d)
  (cond ((< d 0) (cons (- n) (- d)))
        ((cons n d))))

(define (numer x)(car x))

(define (denom x)(cdr x))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(check-equal? (make-rat 1 2) '(1 . 2))
(check-equal? (make-rat (- 1) 2) '(-1 . 2))
(check-equal? (make-rat (- 1) (- 2)) '(1 . 2))
(check-equal? (make-rat 1 (- 2)) '(-1 . 2))