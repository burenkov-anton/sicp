#lang sicp

(#%require rackunit)

(define (make-interval a b)
  (cons a b))

(define (lower-bound interval)
  (car interval))

(define (upper-bound interval)
  (cdr interval))

(define (sub-interval a b)
  (make-interval (- (lower-bound a) (lower-bound b))
                 (- (upper-bound a) (upper-bound b))))

(define lower1 5)
(define lower2 15)
(define upper1 10)
(define upper2 25)
(define interval1 (make-interval lower1 upper1))
(define interval2 (make-interval lower2 upper2))

(check-equal?  (sub-interval interval2 interval2) '(0 . 0))
(check-equal?  (sub-interval interval2 interval1) '(10 . 15))