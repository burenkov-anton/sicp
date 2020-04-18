#lang sicp

(#%require rackunit)

(define (fringe x)
  (if (pair? (car x))
      (let ((step (fringe-step x)))
        (if (pair? (car step))
            (fringe-step step)
            step))
      x))

(define (fringe-step x)
  (if (null? x)
      nil
      (if (pair? x)
          (cons (caar x) (cons (cadar x) (fringe-step (cdr x))))
          x)))

(define (enumerate-tree tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))

(define x (list (list 1 2) (list 3 4)))
(define y (list x x))

(check-equal? (fringe x) (list 1 2 3 4))
(check-equal? (fringe y) '(1 2 3 4 1 2 3 4))
(check-equal? (enumerate-tree y) '(1 2 3 4 1 2 3 4))
