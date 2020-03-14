#lang sicp

(#%require rackunit)

(define (square-list items)
  (if (null? items)
      nil
      (cons (* (car items) (car items)) (square-list (cdr items)))))

(define (square-list-map items)
  (map (lambda (x) (* x x)) items))

(define test-list (list 3 5 7 8 21 4))

(check-equal? (square-list (list 1 2 3 4)) (list 1 4 9 16))
(check-equal? (square-list test-list) (square-list-map test-list))
