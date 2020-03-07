#lang sicp

(#%require rackunit)

(define (last-pair lst)
  (if (null? lst)
      nil
      (if (null? (cdr lst))
          (car lst)
          (last-pair (cdr lst)))))

(check-equal? (last-pair '()) nil)
(check-equal? (last-pair (list 1 2 3 4)) 4)
(check-equal? (last-pair '(4 8 12 16 1)) 1)