#lang sicp

(#%require rackunit)

(define (square x) (* x x))
(define (plus-one x) (+ 1 x))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) nil sequence))

(define (append seq1 seq2)
  (accumulate (lambda (x y) (cons x y)) seq2 seq1))

(define (length sequence)
  (accumulate (lambda (x y) (plus-one y)) 0 sequence))

(define x '(1 2 3))

(check-equal? (map square x) '(1 4 9))
(check-equal? (append x (list 4 5)) (list 1 2 3 4 5))
(check-equal? (length '()) 0)
(check-equal? (length x) 3)

