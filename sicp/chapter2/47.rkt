#lang sicp

(#%require rackunit)

(define (make-vect x y)
  (cons x y))

(define (make-frame-list origin edge1 edge2)
  (list origin edge1 edge2))

(define (make-frame-cons origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (origin frame)
  (car frame))

(define (edge1 frame)
  (cadr frame))

(define (edge2-cons frame)
  (cddr frame))

(define (edge2-list frame)
  (caddr frame))

(define origin-vect (make-vect 1.0 0.5))
(define edge1-vect (make-vect 0.0 1.0))
(define edge2-vect (make-vect 1.0 0.0))

(define x (make-frame-list origin-vect edge1-vect edge2-vect))

(define y (make-frame-cons origin-vect edge1-vect edge2-vect))

(check-equal? (origin x) (origin y))
(check-equal? (edge1 x) (edge1 y))
(check-equal? (edge2-list x) (edge2-cons y))
