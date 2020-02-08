#lang sicp

(#%require rackunit)

(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

(define (make-segment p1 p2)
  (cons p1 p2))

(define (start-point segment)
  (car segment))

(define (end-point segment)
  (cdr segment))

(define (midpoint segment)
  (let (
        (p1 (start-point segment))
        (p2 (end-point segment))
        (x1 (x-point p1))
        (x2 (x-point p2))
        (y1 (y-point p1))
        (y2 (y-point p2))
        )
    (make-point (/ (+ x1 x2) 2) (/ (+ y1 y2) 2))))

(define p1 (make-point 2 3))
(define p2 (make-point 4 5))

(define s (make-segment p1 p2))

(check-equal? (make-point 14 2) '(14 . 2))
(check-equal? (make-segment p1 p2) '((2 . 3) 4 . 5))
(check-equal? (midpoint s) '(3 . 4))