#lang sicp

(#%require rackunit)

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(define x
  (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))

(define y '((1 1 1) (2 3 4) (0 0 0))) 

(check-equal? (accumulate-n + 0 x) (list 22 26 30))
(check-equal? (accumulate-n * 1 x) '(280 880 1944))
(check-equal? (accumulate-n + 0 y) (list 3 4 5))
(check-equal? (accumulate-n * 1 y) '(0 0 0))