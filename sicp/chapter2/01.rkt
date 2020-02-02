#lang sicp

(#%require rackunit)

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (normalize n d)
  (let ((g (abs(gcd n d))))
    (cons (/ n g) (/ d g))))

(define (make-rat n d)
  (cond ((< d 0) (normalize (- n) (- d)))
        ((normalize n d))))

(define (numer x)(car x))

(define (denom x)(cdr x))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define a (make-rat 2 4))
(define b (make-rat 1 2))
(define c (make-rat (- 2) 4))
(define d (make-rat 1 (- 2)))

(check-equal? (make-rat 1 2) '(1 . 2))
(check-equal? (make-rat (- 1) 2) '(-1 . 2))
(check-equal? (make-rat (- 1) (- 2)) '(1 . 2))
(check-equal? (make-rat 1 (- 2)) '(-1 . 2))
(check-equal? (make-rat 2 4) '(1 . 2))
(check-equal? (mul-rat a b) '(1 . 4))
(check-equal? (mul-rat c d) '(1 . 4))
(check-equal? (mul-rat a d) '(-1 . 4))