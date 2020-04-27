#lang sicp

(#%require rackunit)

(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define (reverse-right sequence)
  (fold-right (lambda (x y) (append y (list x))) nil sequence))
(define (reverse-left sequence)
  (fold-left (lambda (x y) (cons y x)) nil sequence))

(define example (list 1 2 3 4 5))

(check-equal? (reverse-right example) (list 5 4 3 2 1))
(check-equal? (reverse example) (reverse-left example))
(check-equal? (reverse-left example) (reverse-right example))
