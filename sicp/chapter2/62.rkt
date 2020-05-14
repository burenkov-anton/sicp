#lang sicp

(#%require rackunit)

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        ((< (car set1) (car set2))
         (cons (car set1) (union-set (cdr set1) set2)))
        ((= (car set1) (car set2))
         (cons (car set1) (union-set (cdr set1) (cdr set2))))
        ((> (car set1) (car set2))
         (cons (car set2) (union-set set1 (cdr set2))))))

(define x '(1 3 5 8))
(define y '(0 1 2 4 9))

(check-equal? (union-set x y) '(0 1 2 3 4 5 8 9))
(check-equal? (union-set x y) (union-set y x))
(check-equal? (union-set '() y) y)
(check-equal? (union-set x '()) x)
(check-equal? (union-set x x) x)
