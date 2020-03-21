#lang sicp

(#%require rackunit)

(define (reverse x)
  (reverse-iter x nil))

(define (reverse-iter x y)
  (if (null? x)
      y
      (reverse-iter (cdr x) (cons (car x) y))))

(define (deep-reverse x)
  (define (helper x)
    (if (null? x)
        nil
        (if (pair? (car x))
            (cons (helper (car x)) (helper (cdr x)))
            (reverse x))))
  (reverse (helper x)))

(define x (list (list 1 2) (list 3 4)))
(define y '((1 2)(3 4)(5 6)))

(check-equal? (deep-reverse x) (list (list 4 3) (list 2 1)))
(check-equal? (deep-reverse y) '((6 5)(4 3)(2 1)))