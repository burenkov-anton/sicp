#lang sicp

(#%require rackunit)

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (car set)) true)
        ((< x (car set)) false)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (define (add x set)
    (if (null? set)
        (cons x set)
        (cond ((< x (car set)) (cons x set))
              ((> x (car set)) (cons (car set) (add x (cdr set)))))))
  (if (element-of-set? x set)
      set
      (add x set)))

(define x (adjoin-set 2 '()))
(define y (adjoin-set 0 x))
(define z (adjoin-set 1 y))
(define q (adjoin-set 1 z))
(define w (adjoin-set 4 q))

(check-equal? z q)
(check-equal? (adjoin-set 1(adjoin-set 0 (adjoin-set 2 '())))
              (adjoin-set 1(adjoin-set 2 (adjoin-set 0 '()))))